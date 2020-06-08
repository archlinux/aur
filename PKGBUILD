# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=f3d
pkgver=1.0.0
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://gitlab.kitware.com/${pkgname}/${pkgname}"
license=('BSD')
depends=('vtk9')
makedepends=('cmake')
provides=('f3d')
source=("https://gitlab.kitware.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8f21a5950434050884f4587aa1587b715eaf34c0895f7fd2b20da726a06204cd')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_TESTING=OFF \
          -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
          ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

