# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vrwm-git
pkgver=r29.e0ffb9e
pkgrel=2
pkgdesc='A virtual reality window manager for X11. Supports "unlimited" virtual monitors.'
arch=('x86_64')
url="https://git.dec05eba.com/vrwm"
license=('GPL3')
makedepends=('git' 'sibs')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes')
provides=('vrwm')
conflicts=('vrwm')
source=("git+https://git.dec05eba.com/vrwm")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/vrwm"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vrwm"
  sibs build --release
}

package() {
  cd "$srcdir/vrwm"
  install -Dm755 "sibs-build/$(sibs platform)/release/vrwm" "$pkgdir/usr/bin/vrwm"
  install -Dm644 images/arrow.png "$pkgdir/usr/share/vrwm/images/arrow.png"
}
