# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
pkgname=trilinos-sacado
pkgver=13.4.0
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
sha256sums=('39550006e059043b7e2177f10467ae2f77fe639901aee91cbc1e359516ff8d3e')


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
