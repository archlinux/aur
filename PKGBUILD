# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmedcon
pkgver=0.22.0
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=("https://prdownloads.sourceforge.net/xmedcon/xmedcon-$pkgver.tar.bz2")
sha256sums=('522ed7a0b4b34cc3c8156ff79c04429af94617ed65ee999c9cab27be7dcd1491')
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
