pkgname=flexiblas
pkgver=3.4.5
pkgrel=1
pkgdesc="A BLAS and LAPACK wrapper library with runtime exchangable backends"
license=('LGPL-3.0+')
arch=('x86_64')
url="https://www.mpi-magdeburg.mpg.de/projects/flexiblas"
makedepends=('cmake')
depends=('gcc-libs')
source=("https://csc.mpi-magdeburg.mpg.de/mpcsc/software/flexiblas/flexiblas-${pkgver}.tar.gz")
sha256sums=('e819949c614c4968919b0ea4e873ab916d95cdc6943e9d091a78d209b7d6ed07')

prepare() {
  cd flexiblas-$pkgver
}

build() {
  cd flexiblas-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DTESTS=OFF -DEXAMPLES=OFF -DDUMMY_HOOK=ON \
        -B build .
  cmake --build build
}

package() {
  cd flexiblas-$pkgver/build
  make DESTDIR="$pkgdir" install
}
