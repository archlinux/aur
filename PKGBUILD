pkgname=flexiblas
pkgver=3.5.0
pkgrel=1
pkgdesc="A BLAS and LAPACK wrapper library with runtime exchangable backends"
license=('LGPL-3.0+')
arch=('x86_64')
url="https://www.mpi-magdeburg.mpg.de/projects/flexiblas"
makedepends=('cmake')
depends=('gcc-libs')
source=("https://csc.mpi-magdeburg.mpg.de/mpcsc/software/flexiblas/flexiblas-${pkgver}.tar.gz")
sha256sums=('4f135fd3d4d844f221624b13734acd0d221a4347a19fa78604a6cbcaa3f477ea')

prepare() {
  cd flexiblas-$pkgver
}

build() {
  cd flexiblas-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DTESTS=OFF -DEXAMPLES=OFF \
        -B build .
  cmake --build build
}

package() {
  cd flexiblas-$pkgver/build
  make DESTDIR="$pkgdir" install
}
