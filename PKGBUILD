# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dseams
pkgver=1.0.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/d-SEAMS/seams-core/archive/v${pkgver}.tar.gz")
sha256sums=('7cf6296372aee00ff94acc1219b9eb88697df25c73de23aec7957e013645c36b')

prepare() {
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