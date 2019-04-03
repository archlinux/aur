# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmysofa
pkgver=0.7
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format'
arch=('i686' 'x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'cunit')
checkdepends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hoene/libmysofa/archive/v${pkgver}.tar.gz")
sha256sums=('c1e6a0a91fee89625a60befec674bf2b4bf17055676933727f106785e0ea42a3')

build() {
    cd "${pkgname}-${pkgver}/build"
    
    cmake \
        -DBUILD_TESTS:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make all
}

check() {
    cd "${pkgname}-${pkgver}/build"
    
    make test
}

package() {
    cd "${pkgname}-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
