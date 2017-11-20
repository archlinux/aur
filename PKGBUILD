# Maintainer: robertfoster

pkgname=ndpi-git
pkgver=261.6f3d5a7
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
replaces=('ndpi')
conflicts=('ndpi')
source=('ndpi::git+https://github.com/ntop/nDPI.git')
makedepends=('git')

pkgver() {
  cd ndpi
  echo $(git rev-list --count dev).$(git rev-parse --short dev)
}

build() {                                                                                                                                                                    
   cd ndpi
   ./autogen.sh
   ./configure --prefix=/usr --with-pic --includedir=/usr/include --libdir=/usr/lib
   make
}
 package() {
   cd ndpi
   make DESTDIR="${pkgdir}/" install
   mv $pkgdir/usr/include/libndpi-${pkgver}*/libndpi $pkgdir/usr/include
   rm -r $pkgdir/usr/include/libndpi-${pkgver}*
   sed -i 's|\/libndpi-2.0.0||g' $pkgdir/usr/lib/pkgconfig/libndpi.pc
 }

md5sums=('SKIP')
