# Previous Maintainer: McNoggins
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=pagmo2
pkgver=2.10
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (version 2)"
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost')
optdepends=('eigen: library for matrix math'
            'coin-or-ipopt: Ipopt optimizer support'
            'nlopt: NLopt optimizer support')
makedepends=('cmake')
_name=pagmo2
source=(https://github.com/esa/${_name}/archive/v${pkgver}.tar.gz)
sha512sums=('87417c105bc887439a7a089d3569e7df942584bf4af4c3fe2df738498bf17be99e450e02ef3d0bf1fdfab5d37cd7a2218aed39492215ed49d9a029a19d143794')

_buildtype="Release"

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}-${pkgver}-build"
    cd "${srcdir}/${_name}-${pkgver}-build"

    cmake \
        -DCMAKE_BUILD_TYPE="${buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${_name}-${pkgver}"

    msg "Building the project"
    make
}

check() {
    cd "${srcdir}/${_name}-${pkgver}-build"
    msg "Running unit tests"
    make test
}

package() {
    cd "${srcdir}/${_name}-${pkgver}-build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
