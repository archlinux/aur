# Maintainer:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.3
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('i686' 'x86_64')
url="http://libwbxml.opensync.org/"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('ceeb6ffd71b636dfdb7bddce9f5eddc2907823cb5f1ba2918a66833e225b5d02')

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
