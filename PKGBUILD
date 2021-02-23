# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon  
pkgver=0.21.0
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/$pkgname/XMedCon-Source/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('08130869d868008d2f3604466b7c674bda1ad64560bcc5c33727161a595ed679')
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
  install -Dm644 "$pkgdir"/usr/etc/xmedconrc "$pkgdir"/etc/xmedconrc
}
