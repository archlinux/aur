# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lbench  
pkgver=6.0
pkgrel=5
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('38083395bd1666a60c11dbd3b9ba0af790091e28a92836ea322cd65fdd4fbbee')

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
