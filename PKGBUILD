# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.3
pkgrel=3
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('85387c8d50b049ef79e5e43ff2e30ffda9e55dc6ffc68eb2b43471b2fbfe1f3c')
options=('!emptydirs')

build() {
  cd $pkgname
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR=$pkgdir install  
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
