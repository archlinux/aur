# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>
# Contributor:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.5
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('i686' 'x86_64')
url="http://libwbxml.opensync.org/"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('5f8fabc0152d73b725e16211ccd74263c1c2f9f1dc36a2fd916a8deb4ee577e2')

prepare() {
  cd ${srcdir}/libwbxml-${pkgver}
    sed '/AUTHORS/d' -i CMakeLists.txt
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd ${srcdir}/libwbxml-${pkgver}/build
  make
}

package() {
  cd ${srcdir}/libwbxml-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
