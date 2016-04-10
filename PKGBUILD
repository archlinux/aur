# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libsteel
pkgver=2.0
pkgrel=1
pkgdesc="library functions for steel"
url="https://www.steelpasswordmanager.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmcrypt' 'mhash' 'sqlite')
source=(https://github.com/nrosvall/libsteel/archive/v2.0.tar.gz)
md5sums=('c80890ab8fd293aa1a6f1f291ddc532d')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's/\(.*\)PREFIX/\1DESTDIR/' Makefile
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -d "$pkgdir/usr/lib"
  make DESTDIR="$pkgdir/usr" PREFIX="/usr" install
}
