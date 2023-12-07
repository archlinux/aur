pkgname=spral
pkgver=2023.11.15
pkgrel=1
pkgdesc="Sparse Parallel Robust Algorithms Library"
arch=('x86_64')
url="https://github.com/ralna/spral"
license=('BSD')
makedepends=('make')
depends=('metis' 'lapack' 'hwloc')
source=("https://github.com/ralna/spral/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('40365b5137d11009861289c76b3ae67128351b83fa1c91f42e239a8d553fc5cb')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  FCFLAGS="${FCFLAGS} -fPIC" CFLAGS="${CFLAGS} -fPIC" CXXFLAGS="${CXXFLAGS} -fPIC" LDFLAGS="${LDFLAGS} -lcblas" ./configure --prefix=/usr
  make -j1
  OMP_CANCELLATION=TRUE OMP_PROC_BIND=TRUE make check
}

package ()
{
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
