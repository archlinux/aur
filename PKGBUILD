# Maintainer: Denis Demidov <dennis.demidov@gmail.com>

pkgname=amgcl-git
pkgver=20180901
pkgrel=5
pkgdesc='C++ library for solving large sparse linear systems with algebraic multigrid method'
arch=('i686' 'x86_64')
url='http://github.com/ddemidov/amgcl'
license=('MIT')
depends=('boost-libs')
optdepeneds=('vexcl-git': 'vexcl backend'
             'hpx-git': 'HPX backend'
             'openmpi: distributed memory solver')
provides=('amgcl')
makedepends=('git' 'cmake' 'boost')
source=(git+https://github.com/ddemidov/amgcl.git)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/amgcl"
    git describe | tr - .
}

build() {
    cd "${srcdir}/amgcl"
    ls
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/amgcl/build"
    DESTDIR=${pkgdir} make install
}
