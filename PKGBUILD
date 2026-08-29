# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=vectorscan
pkgver=5.4.13
pkgrel=2
pkgdesc='Portable fork of hyperscan regular expression matching library'
arch=(x86_64)
url=https://github.com/VectorCamp/vectorscan
license=("BSD-3-Clause")
makedepends=(
  boost
  cmake
  ninja
  pcre
  python
  ragel
  simde
)
depends=(
  libgcc
  libstdc++
  glibc
)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}/${pkgver}.tar.gz")
b2sums=('7d229b100e99d1b4dae0d62d5449074f0a0b7166e2c183db0641adaec38fad4f216dea22b550802e203afc065175d0a4656c770d9405a03363a2586776da9ff8')

build() {
  cd "${srcdir}"
  cmake -S "${pkgname}-${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-author
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 "${pkgname}-${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
