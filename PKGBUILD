# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.3
pkgrel=2
pkgdesc="A backup program using DVDs"
url="https://kornelix.net/dkopp/dkopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'xdg-utils')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('0c9210425df84fcf689d0224d8ad3a345e50f18238601abefcaa03d769bd0474')
options=('!emptydirs')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr LDFLAGS+="-lpthread" make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/applications
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
  sed -i 's+/usr/share/dkopp/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
