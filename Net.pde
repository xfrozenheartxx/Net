
int nDots = 50;
PVector[] dots;
PImage orangeImg;

void setup () {
  size(600, 600);

  dots = new PVector[nDots]; 
  for (int i = 0; i < nDots; i++) {
    dots[i] = new PVector(random(0, width), random(0, height));
  }

orangeImg = loadImage("orange.png");

  noStroke();
}

void draw () {
  background(255);

  updateDots();
  renderDots();
}

void updateDots() {
  for (int i = 0; i < nDots; i++) {
    PVector offset = new PVector(random(-10, 10), random(-3, 3));
    dots[i].add(offset);

    if (dots[i].x < 0) { 
      dots[i].x = width;
    }
    if (dots[i].x > width) { 
      dots[i].x = 0;
    }
    if (dots[i].y < 0) { 
      dots[i].y = height;
    }
    if (dots[i].y > height) { 
      dots[i].y = 0;
    }
  }
}

void renderDots() {
  noStroke();
  for (int i = 0; i < nDots; i++) {
    
    
    image(orangeImg, dots[i].x-16, dots[i].y -16, 32, 32);
    
  }
  stroke(0);
  for (int i = 0; i < nDots; i++) {
    for (int j = i + 1; j < nDots; j++) {
      float distance = dist (dots[i].x, dots[i].y, dots[j].x, dots[j].y);
      if(distance <= 90){
      line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
      }
    }
  }
}
