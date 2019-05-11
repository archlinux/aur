# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=4.0
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('314bbadb24f140e3901f2d6ee19b5afaa6775a8f36b1b3c50fee7a1ba2a5788a')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  chmod 755 "$pkgdir"/usr/bin/$pkgname
  rmdir "$pkgdir"/usr/share/{appdata,$pkgname/locales}
  sed -i 's+/usr/share/lbench/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
