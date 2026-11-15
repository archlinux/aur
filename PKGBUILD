# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=4.5.0
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('AGPL-3.0-only')
depends=('intel-oneapi-tbb' 'hdf5' 'arrow' 'fontconfig' 'freetype2' 'libxcb' 'fftw' 'vulkan-icd-loader')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1491e74388f9cd7f60ff88bc70c6f2e7e35da0e91ad1c4aaa522a23c845bad6')

prepare() {
  cmake -B build -S "Correlation-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
