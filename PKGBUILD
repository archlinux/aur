# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: fdiblen <fdiblen at gmail dot com>

pkgname=casacore
pkgver=3.8.0
pkgrel=1
pkgdesc="Suite of C++ libraries for radio astronomy data processing"
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL-2.0-or-later')
depends=(boost-libs fftw gsl cfitsio wcslib python-numpy)
makedepends=(cmake gcc-fortran gsl boost)
optdepends=('sofa: only for testing casacore measures'
  'hdf5: for the HDF5 C++ bindings')
provides=(
  'libcasa_casa.so=6-64'
  'libcasa_coordinates.so=6-64'
  'libcasa_derivedmscal.so=6-64'
  'libcasa_fits.so=6-64'
  'libcasa_images.so=6-64'
  'libcasa_lattices.so=6-64'
  'libcasa_meas.so=6-64'
  'libcasa_measures.so=6-64'
  'libcasa_mirlib.so=6-64'
  'libcasa_msfits.so=6-64'
  'libcasa_ms.so=6-64'
  'libcasa_python3.so=6-64'
  'libcasa_scimath_f.so=6-64'
  'libcasa_scimath.so=6-64'
  'libcasa_tables.so=6-64')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4831cfde5bc792b9b010c0071b403b507ecb00a43ecb2bda6a6f74f2013d0f311dc11cd567d8d409f2731c68ec4e4e5ab364f5088632b960618f3d776842cd7d')

build() {
  export CXXFLAGS="${CFLAGS}"
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DBUILD_PYTHON=OFF \
    -DBUILD_PYTHON3=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
