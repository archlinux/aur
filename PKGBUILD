# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

pkgname=mp-5-gtk
pkgver=5.2.8
pkgrel=1
pkgdesc="Text editor for programmers (GTK front-end)"
arch=('i686' 'x86_64')
url="http://www.triptico.com/software/mp.html"
license=('GPL')
depends=('gtk2')
provides=('mp-5')
conflicts=('mp-5')
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz
		MinimumProfit.desktop)
md5sums=('2c06f9ebb8bd7b777df504763416de33'
         '7eae413ded2d6f69fba8347240b8b875')

build() {
  cd mp-$pkgver
  ./config.sh --prefix=/usr --without-kde4
  make
}

package() {
  install -Dm644 MinimumProfit.desktop "$pkgdir/usr/share/applications/MinimumProfit.desktop"

  cd mp-$pkgver
  install -D -m644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -d -m755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}

