# Maintainer: Xīcò <xico@atelo.org>

pkgname=sundials
pkgver=2.6.2
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
provides=('sundials')
conflicts=('sundials')
makedepends=('cmake')
source=("http://pkgs.fedoraproject.org/repo/extras/sundials/$pkgname-$pkgver.tar.gz/3deeb0ede9f514184c6bd83ecab77d95/$pkgname-$pkgver.tar.gz")
sha256sums=('d8ed0151509dd2b0f317b318a4175f8b95a174340fc3080b8c20617da8aa4d2f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  #./configure F77=gfortran --prefix=/usr --disable-mpi --with-cflags=-fPIC --enable-shared
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=BOOL:ON "../$pkgname-$pkgver"
  make VERBOSE=1
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
