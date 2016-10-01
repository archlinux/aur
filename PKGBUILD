# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=6.9
pkgrel=1
pkgdesc="A backup program using DVDs"
url="http://www.kornelix.com/dkopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('54e1f31bae6b2fcaff2778f4c795a934a7e6430864f577827d95839904f9da96')
options=('!emptydirs')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr LDFLAGS+="-lpthread" make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/applications
  make DESTDIR=$pkgdir install 
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
