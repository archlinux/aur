# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=vectorscan
pkgver=5.4.11
pkgrel=1
pkgdesc='Portable fork of hyperscan regular expression matching library'
arch=(x86_64)
url=https://github.com/VectorCamp/vectorscan
license=(BSD)
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
b2sums=('a8f5a1230af0ddf7d9fb9299769ec1736d37ac3284f6a98b1e650af461206cf459eac35d13a47beb6683786c6529539b2d082edf426e7d4890ed11804c76268b')

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
