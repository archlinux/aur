# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver
pkgver=1.14.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('gcc-libs' 'cmake')
depends=('google-glog>=0.3.4' 'eigen>=3.3.0'
      'suitesparse>=4.4.5')
optdepends=('openmp')
source=("http://ceres-solver.org/ceres-solver-1.14.0.tar.gz")
sha256sums=("4744005fc3b902fed886ea418df70690caa8e2ff6b5a90f3dd88a3d291ef8e8e")
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
