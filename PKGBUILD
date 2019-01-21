# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=3.8
pkgrel=1
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('0af7fcd77d3c614e7faeece9374e73afeea7f1419f33eb788880774a8e1f9b2b')

prepare() {
  cd $pkgname
  sed -i 's+mkdir -p+install -d+' Makefile
}

build() {
  cd $pkgname
  export PREFIX=/usr
  make CXXFLAGS+=" -Wl,-z,relro,-z,now" 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  chmod 755 "$pkgdir"/usr/bin/$pkgname
  rmdir "$pkgdir"/usr/share/{appdata,$pkgname/locales}
}
