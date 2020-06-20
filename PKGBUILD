# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dseams-git
pkgver=1.0.0.r14.g333cc82
pkgrel=1
pkgdesc="Deferred Structural Elucidation Analysis for Molecular Simulations"
arch=('x86_64')
url='https://dseams.info'
license=('GPL3')
provides=("${pkgname%-git}")
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
source=("dseams::git+https://github.com/d-SEAMS/seams-core")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/seams-core"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/seams-core"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${srcdir}/seams-core/build"
  make
}

package() {
  cd "${srcdir}/seams-core/build"
  make DESTDIR=${pkgdir} install
}