# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmedcon-gtk2  
pkgver=0.17.0
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/${pkgname%-gtk2}/XMedCon-Source/$pkgver/${pkgname%-gtk2}-$pkgver.tar.bz2)
sha256sums=('bf61713d8db8e4cb600eed0f889bf34f5d9df967937c4e4df9074c9a442d490a')
options=('!libtool')
conflicts=('xmedcon')
provides=('xmedcon')

prepare() {
  cd ${pkgname%-gtk2}-$pkgver
  sed -i 's+/usr/etc+/etc+' Makefile.am
}

build() {
  cd ${pkgname%-gtk2}-$pkgver
  autoreconf -i
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd ${pkgname%-gtk2}-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir"/usr/etc/xmedconrc "$pkgdir"/etc/xmedconrc
  rm -rf "$pkgdir"/usr/etc/
}
