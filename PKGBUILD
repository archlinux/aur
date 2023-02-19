# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=7.1
pkgrel=2
arch=('i686' 'x86_64')
depends=('clutter-gtk')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz" watsup.patch)
sha256sums=('f39275ac073cf807de773a58ed4dcb00ace6c7690357076a12ad193dbd887f8a'
            '018b06cccc6ac9ddea342bf07b1c9caebed81adec406bc6cfe5ecefa554e9b6f')
options=('!emptydirs')

prepare() {
  cd $pkgname
  patch -Np1 < "$srcdir"/watsup.patch
}

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/watsup/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
