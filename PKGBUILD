# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.1
pkgrel=3
pkgdesc="A backup program using DVDs"
url="https://kornelix.net/dkopp/dkopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('567fc19f353bc300b6a8cd4fb9f786011ba157b57ffb79a9a215e55be6f7c5dd')
options=('!emptydirs')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr LDFLAGS+="-lpthread" make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/applications
  make DESTDIR="$pkgdir" install 
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}
