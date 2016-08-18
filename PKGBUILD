# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.1
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.com/ukopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('43ba493a8b47d95aca37376b972cf5a10cfeff763723312b61954bd10f14108e')
options=('!emptydirs')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/applications
  make DESTDIR=$pkgdir install
}
