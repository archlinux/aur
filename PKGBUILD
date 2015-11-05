# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mystuff
pkgver=2.1
pkgrel=1
pkgdesc="Create a custom menu in a popup window"
url="http://www.kornelix.com/mystuff"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz")
md5sums=('d20c2f5fb90e1f875804cc10877cb977')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  sed -i 's+/usr/share/mystuff/icons/++' desktop
  make PREFIX=/usr LDFLAGS="-lpthread" ICONDIR=/usr/share/pixmaps
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 desktop $pkgdir/usr/share/applications/$pkgname.desktop 
  make DESTDIR=$pkgdir ICONDIR=/usr/share/pixmaps install 
}
