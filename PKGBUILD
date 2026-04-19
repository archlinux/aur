# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=xmedcon
pkgver=0.26.2
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=("https://prdownloads.sourceforge.net/xmedcon/xmedcon-$pkgver.tar.bz2")
sha256sums=('af4a03039c0c4b66e428280cec2f96c546a11af266ecd500fe250dbb6b9924f1')
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
