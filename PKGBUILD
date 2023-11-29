# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-face-tracker-dlib-models-git
pkgver=r63.89dd713
pkgrel=2
pkgdesc="Trained model files for dlib example packaged for obs-face-tracker"
arch=("any")
url="https://github.com/davisking/dlib-models/"
license=("MIT")
makedepends=("git" "bzip2")
source=("git+https://github.com/davisking/dlib-models.git")
sha256sums=("SKIP")

pkgver() {
  cd dlib-models
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd dlib-models
  
  bunzip2 {mmod_human_face_detector,shape_predictor_5_face_landmarks,shape_predictor_68_face_landmarks}.dat.bz2
}

package() {
  cd dlib-models
  
  mkdir -p "$pkgdir/usr/share/obs/obs-plugins/obs-face-tracker/dlib_face_landmark_model"
  install -Dm644 *.dat -t "$pkgdir/usr/share/obs/obs-plugins/obs-face-tracker/dlib_face_landmark_model"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
