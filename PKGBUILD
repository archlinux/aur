# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=qwlroots-git
pkgver=0.3.0.wlroots0.17.0.18.r7.gf00ee45
pkgrel=1
pkgdesc='Qt and QML bindings for wlroots.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/qwlroots"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
OPTIONS=('staticlibs')
makedepends=('git' 'wlroots' 'ninja' 'wayland-protocols' 'wlr-protocols')
provides=('qwlroots')
source=("git+https://github.com/vioken/qwlroots")
sha512sums=('SKIP')

pkgver() {
  cd qwlroots
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
