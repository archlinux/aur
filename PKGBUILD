# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pygmo
pkgver=2.12.0
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (Python version)"
arch=('i686' 'x86_64')
url="https://esa.github.io/pagmo2/index.html"
license=('GPLv3')
depends=('python' 'boost' 'pagmo' 'python-numpy' 'python-cloudpickle')
optdepends=()
makedepends=('cmake')
_name=pagmo2
source=(https://github.com/esa/${_name}/archive/v${pkgver}.tar.gz)
sha512sums=('b19ca4e4177ab603f368d7ff75919da98f495dc85d6faec351cce7ba2f6f7233cfcadcbd95e4a87a5b00e60ae805c662273d3651da726c8c02e3081ceb4c2954')

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
        -DPAGMO_BUILD_PAGMO=OFF \
        -DPAGMO_BUILD_PYGMO=ON \
        "${srcdir}/${_name}-${pkgver}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}-${pkgver}-build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
