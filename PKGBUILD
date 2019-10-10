# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=svt-vp9
pkgver=0.1.0
pkgrel=1
pkgdesc='Scalable Video Technology VP9 encoder'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-VP9/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'nasm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-VP9/archive/v${pkgver}.tar.gz")
sha256sums=('a38ea33d86b7e56219a8d2d10ba8acaf545a84e72545f72a0d53de346dff2b0f')

prepare() {
    mkdir -p "SVT-VP9-${pkgver}/Build/linux/None"
}

build() {
    cd "SVT-VP9-${pkgver}/Build/linux/None"
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev \
        ../../..
    make
}

package() {
    make -C "SVT-VP9-${pkgver}/Build/linux/None" DESTDIR="$pkgdir" install
    install -D -m644 "SVT-VP9-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
