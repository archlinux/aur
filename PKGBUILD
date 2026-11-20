# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=4.7.2
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('AGPL-3.0-only')
depends=('intel-oneapi-tbb' 'hdf5' 'arrow' 'fontconfig' 'freetype2' 'libxcb' 'fftw' 'vulkan-icd-loader')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('922e1c793585c84db04a2475ad9dc9df3c8f454b4a2cecd6499ce2c81a458703')

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
