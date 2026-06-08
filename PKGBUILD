# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=3.3.1
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('AGPL-3.0-only')
depends=('intel-oneapi-tbb' 'hdf5' 'arrow' 'fontconfig' 'freetype2' 'libxcb')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d57b6a808e1b7d320ed0ba8e7ece89ffd6357f98d7dbe79e3e1c140710ac8f00')

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
