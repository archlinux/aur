# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=4.5
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('4788c166c400905927978bc3a10d0d0bfe60100d92627d64531b13525bc4b1c1')

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
