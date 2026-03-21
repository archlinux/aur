# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=xmedcon
pkgver=0.26.1
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=("https://prdownloads.sourceforge.net/xmedcon/xmedcon-$pkgver.tar.bz2")
sha256sums=('99fe36e2a82dd45aaa9f00d053b6fc5cb40d26c7ac2d08b4ed3d0b74fd5c74f8')
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
