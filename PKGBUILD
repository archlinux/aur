# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=3.7
pkgrel=2
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gdk-pixbuf2' 'pango' 'lm_sensors')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('f8b6d20bf6453acf4687f3168edf7f7aa20f18aaadcc8df4391cd7fe3631eb9f')

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
