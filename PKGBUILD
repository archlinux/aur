# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rkcommon
pkgver=1.6.0
pkgrel=1
pkgdesc='Intel RenderKit common C++/CMake infrastructure'
arch=('x86_64')
url='https://github.com/ospray/rkcommon/'
license=('Apache')
depends=('tbb')
makedepends=('cmake')
source=("https://github.com/ospray/rkcommon/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('24d0c9c58a4d2f22075850df170ec5732cfaa0a16f22f90dbd6538232be009b0')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
