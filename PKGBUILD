# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver
pkgver=1.11.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('gcc-libs' 'cmake')
depends=('google-glog>=0.3.4' 'eigen>=3.2.7'
      'suitesparse>=4.4.5' 'protobuf>=2.6.1')
optdepends=('openmp')
source=("http://ceres-solver.org/ceres-solver-1.11.0.tar.gz")
sha256sums=("4d666cc33296b4c5cd77bad18ffc487b3223d4bbb7d1dfb342ed9a87dc9af844")
options=('staticlibs')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D EIGENSPARSE=ON'
            '-D CXX11=ON')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p ./build
  cd ./build
  cmake ${_cmakeopts[@]} ../
  make
}

package ()
{
  cd $srcdir/$pkgname-$pkgver/build/
  make DESTDIR=$pkgdir install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
