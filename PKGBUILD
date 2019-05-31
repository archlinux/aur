# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-svt-hevc
pkgver=1.3.0
pkgrel=1
pkgdesc='An HEVC-compliant encoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-HEVC/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'yasm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz")
sha256sums=('ef21f3a13e33b4f61af4a0c79337ce9e4f73f6fe13d1c2afe2c3b0712f4158d9')

prepare() {
    cd "SVT-HEVC-${pkgver}"
    
    mkdir -p build
}

build() {
    cd "SVT-HEVC-${pkgver}/build"
    
    cmake \
        -DCMAKE_ASM_NASM_COMPILER:FILEPATH='/usr/bin/yasm' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "SVT-HEVC-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "${srcdir}/SVT-HEVC-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
