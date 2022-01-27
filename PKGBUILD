# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=3.9
pkgrel=1
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.net/mystuff/mystuff.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('5a068854f33b0a7c806c7cffea6448b4b91061184e0734ccef8b838cf3454a50')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/mystuff/icons/++' \
      "$pkgdir"/usr/share/applications/$pkgname.desktop
}
