# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.1
pkgrel=5
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.net/mystuff/mystuff.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('9e20dc8a45f8a51eaf1c8b26c99eccbe0f224143b11ad26298e567c6cdca88cd')
options=('!emptydirs')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  sed -i "s/Icon=\/usr\/share\/mystuff\/icons\//Icon=\/usr\/share\/pixmaps\//" ./mystuff.desktop
}

build() {
    cd $pkgname-$pkgver 
  make PREFIX=/usr LDFLAGS="-lpthread" ICONDIR=/usr/share/pixmaps
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
}
