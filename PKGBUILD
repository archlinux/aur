# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libsteel
_pkgver=1.0-14ec81fbffba79ba2bb663b4966af1d0e1b93e3f
pkgver=1.0
pkgrel=3
pkgdesc="library functions for steel"
url="https://www.steelpasswordmanager.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmcrypt' 'mhash' 'sqlite')
source=(https://github.com/nrosvall/libsteel/archive/v1.0.tar.gz)
md5sums=('6c008bed7525f95103247aa8d6c3ad29')

prepare() {
  cd "$srcdir"/$pkgname-v$_pkgver
  sed -i 's/\(.*\)PREFIX/\1DESTDIR/' Makefile
}

build() {
  cd "$srcdir"/$pkgname-v$_pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-v$_pkgver
  install -d "$pkgdir/usr/lib"
  make DESTDIR="$pkgdir/usr" PREFIX="/usr" install
}
