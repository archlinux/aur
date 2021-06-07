# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dkopp
pkgver=7.7
pkgrel=5
pkgdesc="A backup program using DVDs"
url="https://kornelix.net/dkopp/dkopp.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('d0d93d9ae3c1f0973977324a97234e91d1f1aaf34f9d80827d754a74b5cb3668')
options=('!emptydirs')

build() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  PREFIX=/usr make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/applications
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
  sed -i 's+/usr/share/dkopp/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
