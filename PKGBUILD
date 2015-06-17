# Maintainer: M0Rf30

pkgname=ndpi-xplico-svn
pkgver=6937
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
replaces=('ndpi' 'ndpi-svn')
conflicts=('ndpi' 'ndpi-svn')
source=('ndpi::svn+https://svn.ntop.org/svn/ntop/trunk/nDPI#revision=6937'
	patch)
makedepends=('subversion')

pkgver() {
  cd ndpi
  svnversion | tr -d [A-z]
}

build() {
  cd ndpi
  ./configure --prefix=/usr
  patch -Np1 -i ../patch
  make
}
         
package() {
  cd ndpi
  make DESTDIR="$pkgdir" install
  cp src/include/*.h $pkgdir/usr/include/libndpi/
}

md5sums=('SKIP'
         '4584b764ef17faa91345808eca48b9ba')
