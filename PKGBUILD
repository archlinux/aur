# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon  
pkgver=0.14.1
pkgrel=3
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/$pkgname/XMedCon-Source/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('59c9211857790c2453ce5d13f8743a90')
options=('!libtool')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -i
  sed -i 's+/usr/etc+/etc+' Makefile
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir"/usr/etc/xmedconrc "$pkgdir"/etc/xmedconrc
  rm "$pkgdir"/usr/etc/xmedconrc
  rmdir "$pkgdir"/usr/etc
}
