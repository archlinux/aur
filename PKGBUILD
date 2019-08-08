# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-pygmo
pkgver=2.11
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
sha512sums=('6b7da56db3e2f1e0627cd84d1ccd7d40f4838ef2e54274d802bd040926dd159e88f692fb6e4146e5e620a10298a539992460ebd3efad611db2e998cb8c20f478')

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
