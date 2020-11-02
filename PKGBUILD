# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver
pkgver=2.0.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('cmake')
depends=('google-glog>=0.3.4' 'eigen>=3.3.0'
      'suitesparse>=4.4.5')
optdepends=('openmp')
source=("http://ceres-solver.org/ceres-solver-2.0.0.tar.gz")
sha256sums=("10298a1d75ca884aa0507d1abb0e0f04800a92871cd400d4c361b56a777a7603")
options=('staticlibs')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D EIGENSPARSE=ON'
            '-D BUILD_SHARED_LIBS=ON'
            '-D BUILD_TESTING=OFF'
            '-D BUILD_EXAMPLES=OFF'
            '-D BUILD_BENCHMARKS=OFF')

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
