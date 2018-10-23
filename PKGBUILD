# Maintainer: robertfoster

pkgname=ndpi
pkgver=2.4
pkgrel=2
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=('staticlibs' '!strip')
source=("https://github.com/ntop/nDPI/archive/$pkgver.tar.gz"
	make-patch)

build() {
  cd ${srcdir}/nDPI-$pkgver
  patch -Np1 -i ../make-patch
  ./autogen.sh
  ./configure --prefix=/usr --with-pic --includedir=/usr/include --libdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/nDPI-$pkgver
  make DESTDIR="${pkgdir}" install
}

md5sums=('110478950391bbe8b25201c6a09e2516'
         '5b359b62300accf27087060a853f04c8')
