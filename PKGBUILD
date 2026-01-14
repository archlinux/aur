# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=xmedcon
pkgver=0.25.3
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=("https://prdownloads.sourceforge.net/xmedcon/xmedcon-$pkgver.tar.bz2")
sha256sums=('f55ad340feb5e2d22b999466f5b4a99a55ea09b30fceabe1bf6db678588a4b83')
options=('!libtool')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's+/usr/etc+/etc+' Makefile.am
}

build() {
  cd $pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
