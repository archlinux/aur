# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=f3d
pkgver=0.1.0
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://gitlab.kitware.com/${pkgname}/${pkgname}"
license=('BSD')
depends=('vtk-raytracing-git')
makedepends=('cmake')
source=("https://gitlab.kitware.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('de08cd2342c1a11e25787931fec0af8dfb9b3cff2ed27675d0df10f962ab6fdc')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_TESTING=OFF \
          ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    install -dv "${pkgdir}"/usr/share/licenses/f3d
    mv "${pkgdir}"/usr/LICENSE "${pkgdir}"/usr/share/licenses/f3d

    install -dv "${pkgdir}"/usr/share/doc/f3d
    mv "${pkgdir}"/usr/README.md "${pkgdir}"/usr/share/doc/f3d
}

