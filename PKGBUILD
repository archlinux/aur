# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.2
pkgrel=2
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.net/mystuff/mystuff.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('c3d659ceb6c315a72aefe27afb4ee4e638de7b8adc16429f593de9a307e161d7')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/mystuff/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
