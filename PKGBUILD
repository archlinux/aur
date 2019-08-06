# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon  
pkgver=0.16.2
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/$pkgname/XMedCon-Source/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('75a1623714745efe03a8abd654f0715d56c5497f9b494f3e1e74cb52274f64d8')
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
  rm "$pkgdir"/usr/etc/xmedconrc
  rmdir "$pkgdir"/usr/etc
}
