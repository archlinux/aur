# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=planarity
pkgver=2.2.0
pkgrel=1
pkgdesc="A library for implementing graph algorithms"
arch=(i686 x86_64)
url="https://code.google.com/p/planarity/"
license=(BSD)
depends=(glibc)
makedepends=()
source=("http://mirrors.mit.edu/sage/spkg/upstream/$pkgname/$pkgname-$pkgver.tar.bz2" 'no-nauty.patch')
md5sums=('3e05f05ad8bf777e6a7ad48958a18c06'
         'fd0368575784dafb0e97d229494cdfc2')

prepare() {
  cd $pkgname-$pkgver

# Fix build without nauty
  patch -p1 -i "$srcdir"/no-nauty.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}

