# Maintainer: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Kyle Brooks <brookskd[at]gmail[dot]com>
# Contributor: bl4ckb0x <navkamal90[at]gmail[dot]com>

_pkgname=systemc
pkgname=systemc-cmake
pkgver=2.3.3
pkgrel=1
pkgdesc="Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems. (CMake build)"
url="http://www.accellera.org/downloads/standards/systemc"
arch=('x86_64' 'i686')
license=('APACHE')
makedepends=('cmake')
conflicts=('systemc')
provides=('systemc')
source=("http://accellera.org/images/downloads/standards/systemc/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('831255f8e76e1cf776e0407c92c7a0b70ba63cf6b1785a2df372a6394440944540a8ae62264ef5293a7b951bd8b37de089ef0dbc0ee2d0354e69ce552c020ca2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p objdir
  cd objdir
  cmake -DCMAKE_CXX_STANDARD=11 -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j $(getconf _NPROCESSORS_ONLN)
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}/objdir"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/objdir"
  make DESTDIR="${pkgdir}" install
}
