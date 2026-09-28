# Maintainer: DDumbying <https://github.com/DDumbying>
pkgname=dchess
pkgver=1.0.0
pkgrel=1
pkgdesc="Chess in your terminal: an engine, analysis, puzzles and UCI support"
arch=('x86_64' 'aarch64')
url="https://github.com/DDumbying/dchess"
license=('MIT')
depends=('glibc' 'ncurses')
checkdepends=('groff')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89803b66a0eb63efe09cf7a5ebcfa98dfbc8ed1204dc8d88e0060a9032b7a0cd')

build() {
  cd "$pkgname-$pkgver"
  # makepkg's flags ride on the Makefile's own
  make "CFLAGS_EXTRA=$CFLAGS $CPPFLAGS" "LDFLAGS=$LDFLAGS -lncursesw -pthread -lm"
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
