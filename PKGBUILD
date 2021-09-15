# Maintainer: chn <g897331845@gmail.com>
pkgname=xtensor-io
pkgver=0.12.9
pkgrel=1
pkgdesc="xtensor plugin to read and write images, audio files, numpy (compressed) npz and HDF5"
arch=('any')
url="https://github.com/xtensor-stack/xtensor-io"
license=('BSD-3-Clause')
depends=('xtensor' 'openimageio' 'libsndfile' 'zlib' 'highfive' 'hdf5' 'blosc' 'gdal')
makedepends=('cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtensor-stack/xtensor-io/archive/${pkgver}.tar.gz"
  '001-install-libdeps.patch')

prepare() {
  cd "$srcdir"
  patch -Np0 < 001-install-libdeps.patch
}

build() {
	cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DHAVE_OIIO=ON \
    -DHAVE_SndFile=ON \
    -DHAVE_ZLIB=ON \
    -DHAVE_HighFive=ON \
    -DHAVE_Blosc=ON \
    -DHAVE_GDAL=ON \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}

md5sums=('13e6d74ba6d188b19e91157d953d2ce5'
         '1f2dd61abb24917caac845c0cbc5473c')
