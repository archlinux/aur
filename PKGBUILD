# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: fdiblen <fdiblen at gmail dot com>

pkgname=casacore
pkgver=3.5.0
pkgrel=2
pkgdesc="Suite of C++ libraries for radio astronomy data processing"
arch=('x86_64')
url="https://github.com/casacore/casacore"
license=('GPL')
depends=('boost-libs' 'fftw' 'gsl' 'openblas' 'lapack' 'cfitsio' 'wcslib' 'python-numpy')
makedepends=('cmake' 'gcc-fortran' 'gsl' 'boost')
optdepends=(
  'sofa: only for testing casacore measures'
  'hdf5'
  'ncurses')
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63f1c8eff932b0fcbd38c598a5811e6e5397b72835b637d6f426105a183b3f91')

build() {
  export CXXFLAGS="${CFLAGS}"
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_PYTHON=OFF \
    -DBUILD_PYTHON3=ON \
    -DUSE_CCACHE=ON \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  make -C build install DESTDIR="$pkgdir/"
}

# vim:set ts=4 sw=2 ft=sh et:
