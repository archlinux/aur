# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r2.b13cbfd
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
makedepends=('git' 'sibs')
depends=('gtk3' 'libx11' 'libpulse' 'gpu-screen-recorder')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("git+https://git.dec05eba.com/gpu-screen-recorder-gtk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/gpu-screen-recorder-gtk"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/gpu-screen-recorder-gtk"
  sibs build --release
}

package() {
  cd "$srcdir/gpu-screen-recorder-gtk"
  install -Dm755 "sibs-build/$(sibs platform)/release/gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
}
