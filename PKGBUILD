# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.6
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('x86_64')
url="https://sourceforge.net/projects/libwbxml/"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('2f5ffe6f59986b34f9032bfbf013e32cabf426e654c160d208a99dc1b6284d29')

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
