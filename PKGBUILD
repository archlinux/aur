# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.1
pkgrel=1
pkgdesc="A backup program using DVDs"
url="https://kornelix.net/dkopp/dkopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('225e96cedf26459247e03228e3e3bfbccb9cdefd2f31c4652df0b4f8de6c3b5b')
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
