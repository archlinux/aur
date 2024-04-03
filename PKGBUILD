pkgname=eigen-git
pkgver=3.4.r1041.gbe54cc8
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

pkgver() {
  cd "${srcdir}/eigen"
  printf "$(git describe --long --tags --abbrev=7 | sed 's/^before-//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cmake -B build -S eigen
}

package() {
  cmake --install build --prefix "$pkgdir"/usr
}
