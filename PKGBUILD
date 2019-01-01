# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=3.7
pkgrel=3
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'lm_sensors')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('e737c85d6dc7c9b668c2f79b3e454f36e9e2baf2e1d83862989f5457ee5b0b19')

prepare() {
  cd $pkgname
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
}

build() {
  cd $pkgname
  export PREFIX=/usr
  make LDFLAGS="-lpthread" 
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
