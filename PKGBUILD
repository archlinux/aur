# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=simbody
pkgver=3.6.1
pkgrel=1
pkgdesc="High-performance C++ multibody dynamics/physics library for simulating articulated biomechanical and mechanical systems like vehicles, robots, and the human skeleton."
arch=('i686' 'x86_64')
url="https://simtk.org/home/simbody"
license=('Apache')
depends=('lapack' 'blas')
optdepends=('freeglut' 'libxi' 'libxmu' 'doxygen')
makedepends=('cmake')
provides=()
conflicts=()

source=("https://github.com/simbody/${pkgname}/archive/Simbody-${pkgver}.tar.gz")
sha256sums=('7716d6ea20b950e71e8535faa4353ac89716c03fd7a445dd802eb6a630796639')

_buildtype="Release"

build() {

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-Simbody-${pkgver}/build"
    cd "${srcdir}/${pkgname}-Simbody-${pkgver}/build"

    # Build project
    cmake .. \
        -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
        #-DCMAKE_INSTALL_LIBDIR=lib

    msg "Building the project"
    make -j4
}

#check() {
#    cd "${srcdir}/${pkgname}-Simbody-${pkgver}/build"
#    make test
#}

package() {

    cd "${srcdir}/${pkgname}-Simbody-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
