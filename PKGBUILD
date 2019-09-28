# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pygmo
pkgver=2.11.3
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
sha512sums=('47b8b2391497468f16ce9bfb40d0ad81cc97c0e0618de8d3ba8745e4a2f8598b70c5012d4e63f8a2846c2011f46c815156ba577648a65309d56ad7a5ad094079')

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
