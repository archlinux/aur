# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
pkgname=trilinos-sacado
pkgver=13.2.0
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="automatic differentiation library within the trilinos framework"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('boost')
makedepends=('gcc-fortran' 'cmake')
conflicts=('trilinos')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-$_pkgver.tar.gz"
        'python-mpi-version.patch')
sha256sums=('0ddb47784ba7b8a6b9a07a4822b33be508feb4ccd54301b2a5d10c9e54524b90'
            '9920ddf718ff04a14d1263623dfd98791404b1db0a73d95ba48d87215e8409eb')

prepare() {
  patch -d  Trilinos-trilinos-release-"$_pkgver" -p1 -i ../python-mpi-version.patch
}

build() {
    cd Trilinos-trilinos-release-"$_pkgver"
    mkdir -p build
    cd build

    cmake .. -DTrilinos_ENABLE_Sacado=ON \
             -DTrilinos_ENABLE_Kokkos=OFF \
             -DTrilinos_ENABLE_Teuchos=OFF \
             -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make VERBOSE=1
}

package() {
    cd Trilinos-trilinos-release-"$_pkgver"/build
    make DESTDIR="$pkgdir" install
}
