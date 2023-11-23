# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
pkgname=trilinos-sacado
pkgver=15.0.0
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="automatic differentiation library within the trilinos framework"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('boost')
makedepends=('gcc-fortran' 'cmake')
conflicts=('trilinos')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-$_pkgver.tar.gz")
sha256sums=('5651f1f967217a807f2c418a73b7e649532824dbf2742fa517951d6cc11518fb')


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
