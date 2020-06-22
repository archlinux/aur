# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vrwm-git
pkgver=r17.fad81ac
pkgrel=2
pkgdesc='A virtual reality window manager for X11. Supports "unlimited" virtual monitors.'
arch=('x86_64')
url="https://git.dec05eba.com/vrwm"
license=('GPL3')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite')
makedepends=('sibs')
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
}
