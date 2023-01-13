# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmedcon
pkgver=0.23.0
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=("https://prdownloads.sourceforge.net/xmedcon/xmedcon-$pkgver.tar.bz2")
sha256sums=('835091243a242c3cc1fb5608b9540d07204bc74d42238ec4c067a5baa543ba39')
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
