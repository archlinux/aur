# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.1
pkgrel=2
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('d37f182526cb110dd40f4dd2babdb653')
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
