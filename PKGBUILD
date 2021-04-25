# Maintainer: lis
# Contributor: mis
# Contributor: oslik
pkgname=solvespace
pkgver=3.0
pkgrel=0
pkgdesc="A parametric 3d CAD program"
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('json-c' 'glew' 'gtkmm')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/${pkgname}/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init extlib/{libdxfrw,mimalloc}
    mkdir build
}

build() {
    cd "${srcdir}/${pkgname}/build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/${pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_OPENMP=ON
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install
}
