# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rkcommon
pkgver=1.5.1
pkgrel=1
pkgdesc='Intel RenderKit common C++/CMake infrastructure'
arch=('x86_64')
url='https://github.com/ospray/rkcommon/'
license=('Apache')
depends=('tbb')
makedepends=('cmake')
source=("https://github.com/ospray/rkcommon/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('27dc42796aaa4ea4a6322f14ad64a46e83f42724c20c0f7b61d069ac91310295')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -W-nodev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
