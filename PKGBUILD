# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=2.9
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'lm_sensors')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('8b1fdd36452e8ff5628f292f12be0097')

build() {
  cd $srcdir/$pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 desktop $pkgdir/usr/share/applications/$pkgname.desktop 
  make DESTDIR=$pkgdir PREFIX=/usr install
}
