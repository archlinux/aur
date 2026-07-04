# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=3.6.0
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('AGPL-3.0-only')
depends=('intel-oneapi-tbb' 'hdf5' 'arrow' 'fontconfig' 'freetype2' 'libxcb' 'fftw')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e955955b63eb187c14c6474480e12343679928a7dcb34b1a3d21bdbf97b2bb6e')

prepare() {
  cmake -B build -S "Correlation-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WITH_HDF5=ON \
    -DBUILD_WITH_ARROW=ON \
    -G Ninja
}

build() {
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
