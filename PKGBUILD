# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=qwlroots-git
pkgver=r232.dd9c126
pkgrel=1
pkgdesc='Qt and QML bindings for wlroots.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/qwlroots"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'wlroots' 'ninja' 'wayland-protocols' 'wlr-protocols')
provides=('qwlroots')
source=("git+https://github.com/vioken/qwlroots")
sha512sums=('SKIP')

pkgver() {
  cd qwlroots
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd qwlroots
  cmake -B . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd qwlroots
  DESTDIR="$pkgdir" ninja install
}
