# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=fprime
pkgver=1.2
pkgrel=1
pkgdesc="A Flight-Proven, Multi-Platform, Open-Source Flight Software Framework"
arch=('i686' 'x86_64')
url="https://github.com/nasa/fprime"
license=('Apache-2.0')
depends=('gcc')
optdepends=()
makedepends=('cmake')
_pkgname="fprime-NASA"
source=(https://github.com/nasa/${pkgname}/archive/NASA-v${pkgver}.tar.gz)
sha256sums=('180ae41d5708de4f3d81cb4201b7ad3fae47f0d36bef5dde2078f5d3a7e53d53')

build() {

    msg "Starting CMake"

    # Create a build directory
    mkdir -p "${srcdir}/${_pkgname}-v${pkgver}/build"
    cd "${srcdir}/${_pkgname}-v${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
