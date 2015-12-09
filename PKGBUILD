# Maintainer:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.4
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('i686' 'x86_64')
url="http://libwbxml.opensync.org/"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('8057998042b8a724328346a50c326010ba011a40e18e2df7043e87498a679c28')

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
