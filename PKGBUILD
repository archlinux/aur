# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=4.10.0
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('AGPL-3.0-only')
depends=('intel-oneapi-tbb' 'hdf5' 'arrow' 'fontconfig' 'freetype2' 'libxcb' 'fftw' 'vulkan-icd-loader')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08c362c511def243d8221e4cd847b86fd4e42b56f1f9fa35b1999323472391c6')

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
