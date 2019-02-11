# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.1
pkgrel=4
pkgdesc="A backup program using DVDs"
url="https://kornelix.net/dkopp/dkopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('c078c9d979febfade15a7f7b486941cfe9f7c8af4b257ae9643e5bc7273e9beb')
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
