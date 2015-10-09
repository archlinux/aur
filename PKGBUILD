# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=3.3
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('gtk3' 'gdk-pixbuf2' 'lm_sensors')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz")
md5sums=('0b8282dcad7d4a787642ecb397a66823')

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
