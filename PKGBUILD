# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.0
pkgrel=1
pkgdesc="Stellar Simulation"
url="http://www.kornelix.com/galaxy2"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz")
md5sums=('c47b71416dfaa39d2d56b98e7374fcba')
options=('!emptydirs')

build() {
  cd $srcdir/$pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/applications
  install -Dm644 desktop $pkgdir/usr/share/applications/$pkgname.desktop 
  make DESTDIR=$pkgdir install  
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
