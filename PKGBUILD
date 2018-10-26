# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmysofa
pkgver=0.6
pkgrel=3
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format'
arch=('i686' 'x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('glibc' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hoene/libmysofa/archive/v${pkgver}.tar.gz")
sha256sums=('e39c34bd40d17aecdb962ba6ae533a3fa9d291da4db6972d0d6e023974a1c169')

build() {
    cd "${pkgname}-${pkgver}/build"
    
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DBUILD_TESTS:BOOL='OFF' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make all
}

package() {
    cd "${pkgname}-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
