# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lbench  
pkgver=4.8
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('a01ffa2010eb8478a41df7cc68cdb526038099cf164eeb7d401a04dad90d557e')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  chmod 755 "$pkgdir"/usr/bin/$pkgname
  chmod o+r "$pkgdir"/usr/share/lbench/images/save.png
  sed -i 's+/usr/share/lbench/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
