# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmedcon  
pkgver=0.21.1
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3')
source=(http://downloads.sourceforge.net/project/$pkgname/XMedCon-Source/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('f0deeb3757983d81810eeae69911e6d24bd9e53c8216a15827a939bc63d35a40')
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
