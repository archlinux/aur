# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver
pkgver=1.12.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('gcc-libs' 'cmake')
depends=('google-glog>=0.3.4' 'eigen>=3.2.7'
      'suitesparse>=4.4.5')
optdepends=('openmp')
source=("http://ceres-solver.org/ceres-solver-1.12.0.tar.gz")
sha256sums=("745bfed55111e086954126b748eb9efe20e30be5b825c6dec3c525cf20afc895")
options=('staticlibs')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D EIGENSPARSE=ON'
            '-D CXX11=ON')

build() {
  cd $srcdir/$pkgname-$pkgver

  mkdir -p ./build
  cd ./build
  cmake ${_cmakeopts[@]} ../ -DLIB_SUFFIX=""
  make
}

package ()
{
  cd $srcdir/$pkgname-$pkgver/build/
  make DESTDIR=$pkgdir install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
