# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lbench  
pkgver=6.0
pkgrel=2
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('f2a648be93b311c86458b9c52472b25b7b35b8c63ed1a1c54ef33330b97c4b5e')

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
