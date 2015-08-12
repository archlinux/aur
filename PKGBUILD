# Maintainer: Peter Gottesman<peter@petergottesman.com>
pkgname=openmpi-1.10
pkgver=1.10.0rc2
pkgrel=1
pkgdesc="A High Performance Message Passing Library"
arch=(any)
url="http://www.open-mpi.org"
license=('BSD')
makedepends=(gcc gcc-fortran)
source=(http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-$pkgver.tar.gz)
md5sums=('a4f37a1e76b9f90bfd6cc293a887ac4b')

build() {
    cd "openmpi-$pkgver"

    ./configure --prefix=/usr \
        --with-hwloc=/usr \
        --sysconfdir=/etc/openmpi \
        --enable-mpi-fortran=all \
        --libdir=/usr/lib/openmpi \
        --with-threads=posix 
    make
}

check() {
    cd "openmpi-$pkgdir"
    
    make check
}

package() {
    cd "openmpi-$pkgver"

    make DESTDIR="$pkgdir/" install
}
