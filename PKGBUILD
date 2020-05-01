# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r34.339bb0a
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://github.com/DEC05EBA/gpu-screen-recorder"
license=('GPL3')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libxdamage' 'alsa-lib' 'libpulse' 'nvidia-utils' 'cuda' 'libglvnd' 'libx11')
makedepends=('sibs')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("git+https://github.com/DEC05EBA/gpu-screen-recorder.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/gpu-screen-recorder"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/gpu-screen-recorder"
  sibs build --release
}

package() {
  cd "$srcdir/gpu-screen-recorder"
  install -D -m +x "sibs-build/$(sibs platform)/release/gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
