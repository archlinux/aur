# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=spirv-llvm-translator
_srcname=SPIRV-LLVM-Translator
pkgver=7.0.1
pkgrel=3
_build=1
pkgdesc='Tool and a library for bi-directional translation between SPIR-V and LLVM IR'
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-LLVM-Translator/'
license=('custom')
makedepends=('cmake' 'llvm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/${pkgver}-${_build}.tar.gz")
sha256sums=('8595a964aee35baa73ff1d41eeec08e582f1ac82e63ec261f8900154a39d9f17')

build() {
    cd "${_srcname}-${pkgver}-${_build}"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL='ON' \
        -Wno-dev \
        .
        
    make
    
}

package() {
    cd "${_srcname}-${pkgver}-${_build}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
