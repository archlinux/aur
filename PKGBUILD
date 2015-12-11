# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=2.7
pkgrel=2
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.com/lbench/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'lm_sensors')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('a9fd4fb35c6b14739475dc71df237c5c')

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
