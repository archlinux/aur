# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=vectorscan
pkgver=5.4.12
pkgrel=1
pkgdesc='Portable fork of hyperscan regular expression matching library'
arch=(x86_64)
url=https://github.com/VectorCamp/vectorscan
license=("BSD-3-Clause-Clear")
makedepends=(
  boost
  cmake
  ninja
  python
  ragel
)
depends=(
  gcc-libs
  glibc
)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}/${pkgver}.tar.gz")
b2sums=('7d2a5934423ea5ef7153ab04544e9819d3c95644352780f6614ec2e896cbde4d92cffe6433eab86a55be26c2dd968d4d0ea7867d7c1251d4631af9da33d39f31')

build() {
  cd "${srcdir}"
  cmake -S "${pkgname}-${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 "${pkgname}-${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
