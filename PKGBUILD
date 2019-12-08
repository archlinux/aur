# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=kindr
pkgver=1.2.0
pkgrel=1
pkgdesc="Kinematics and Dynamics for Robotics"
arch=('i686' 'x86_64')
url="https://github.com/ANYbotics/kindr"
license=('BSD 3-Clause')
depends=('eigen')
optdepends=()
makedepends=('cmake' 'gcc')
source=(https://github.com/ANYbotics/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('05731cfe83b59e8efbc1f84f38105e7bdb3a38c0b30030c2a80c5f0c3870fb5d')

_buildtype="Release"

build() {

    cd "${srcdir}/${pkgname}-${pkgver}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake \
        -DCMAKE_BUILD_TYPE="${buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${pkgname}-${pkgver}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
