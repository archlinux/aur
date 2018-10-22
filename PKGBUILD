# Maintainer: robertfoster

pkgname=ndpi
pkgver=2.4
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=('staticlibs')
source=("https://github.com/ntop/nDPI/archive/$pkgver.tar.gz")

build() {
  cd ${srcdir}/nDPI-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --with-pic --includedir=/usr/include --libdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/nDPI-$pkgver
  make DESTDIR="${pkgdir}/" install
  mv $pkgdir/usr/include/libndpi-${pkgver}*/libndpi $pkgdir/usr/include
  rm -r $pkgdir/usr/include/libndpi-${pkgver}*
  sed -i 's|\/libndpi-2.0.0||g' $pkgdir/usr/lib/pkgconfig/libndpi.pc
}

md5sums=('110478950391bbe8b25201c6a09e2516')
