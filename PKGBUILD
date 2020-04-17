pkgname=eigen-git
pkgver=3.2.92.r8463
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra."
arch=('any')
url='https://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
makedepends=('cmake' 'pkg-config' 'freeglut' 'gcc-fortran' 'fftw' 'suitesparse' 'boost' 'git')
source=("git+https://gitlab.com/libeigen/eigen.git")
sha1sums=('SKIP')
provides=('eigen')
conflicts=('eigen')

prepare () {
  cd "${srcdir}/eigen"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../eigen
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}
