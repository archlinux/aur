# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.1
pkgrel=6
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.net/mystuff/mystuff.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('ae807e18a2088deec1496d652ea8fada616ce1d7ec6ef3e5858d0639de3d79a9')
options=('!emptydirs')

prepare() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  sed -i "s/Icon=\/usr\/share\/mystuff\/icons\//Icon=\/usr\/share\/pixmaps\//" ./mystuff.desktop
}

build() {
    cd $pkgname
  make PREFIX=/usr LDFLAGS="-lpthread" ICONDIR=/usr/share/pixmaps
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install 
}
