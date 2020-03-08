# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=4.3
pkgrel=2
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('cef03d4a784bf7abe3acc090ec926895fc8fb1e289e3bf72e6425db792bb2615')

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
