# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dseams-git
pkgver=1.0.0.r14.g333cc82
pkgrel=1
pkgdesc="Deferred Structural Elucidation Analysis for Molecular Simulations"
arch=('x86_64')
url='https://dseams.info'
license=('GPL-3.0')
provides=("${pkgname%-git}")
depends=('gsl'
         'boost'
         'lua'
         'blas'
         'editline'
         'lapack'
         'rang'
         'yaml-cpp'
         'catch2')
makedepends=('git')
source=("git+https://github.com/d-SEAMS/seams-core")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/seams-core"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/seams-core"
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
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/dseams/LICENSE"
}