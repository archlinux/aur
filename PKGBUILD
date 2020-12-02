# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dseams
pkgver=1.0.1
pkgrel=1
pkgdesc="Deferred Structural Elucidation Analysis for Molecular Simulations"
arch=('x86_64')
url='https://dseams.info'
license=('GPL3')
depends=('fmt'
         'yaml-cpp'
         'lua'
         'gsl')
makedepends=('boost'
             'blas'
             'editline'
             'lapack'
             'rang'
             'catch2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/d-SEAMS/seams-core/archive/v${pkgver}.tar.gz"
        'duplicate_case.patch')
sha256sums=('b71c7b0665b4c44c9ae6071a09f1ef86ed50b661bcfa12e2e002a86c28f8114f'
            '13004cd4312d2a51024f63359173db3c4e31c7ed4dccc9d89c686bed3aeb9548')

prepare() {
  patch -R -p1 < "${srcdir}/duplicate_case.patch"
  cd "${srcdir}/seams-core-${pkgver}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${srcdir}/seams-core-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/seams-core-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}
