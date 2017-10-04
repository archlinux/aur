# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=ngsolve-git
pkgver=v6.2.1709.108.g9513c994
pkgrel=1
pkgdesc="A general purpose Finite Element Library on top of Netgen."
url=https://sourceforge.net/projects/ngsolve/
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('lapack' 'blas' 'netgen-git')
options=('!buildflags')
source=("${pkgname%-git}::git+https://github.com/NGSolve/ngsolve.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  rm -rf build
  mkdir build && cd build

  cmake \
    -DNETGEN_DIR=/usr \
    -DUSE_UMFPACK=ON \
    -DCMAKE_BUILD_TYPE=RELEASE \
    ..

  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install
}

