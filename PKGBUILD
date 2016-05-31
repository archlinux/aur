# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=3.6
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'lm_sensors')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('a9776507ea07079ad40c04a3a2b542ee')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr 
}

package() { 
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
