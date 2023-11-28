# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=qwlroots-git
pkgver=r227.6c575f0
pkgrel=1
pkgdesc='Qt and QML bindings for wlroots.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/qwlroots"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'wlroots' 'wlr-protocols' 'ninja' 'wayland-protocols')
provides=('qwlroots')
source=("$pkgname::git+https://github.com/vioken/qwlroots")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $pkgname
  cmake -B . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
