# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.0
pkgrel=1
pkgdesc="A backup program using DVDs"
url="http://www.kornelix.com/dkopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('c3ccb853676f3fc7858522e63321b629b1207f3219018684d8f6a8e626379d30')
options=('!emptydirs')

build() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr LDFLAGS+="-lpthread" make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/applications
  make DESTDIR="$pkgdir" install 
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}
