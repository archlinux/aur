# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmysofa
pkgver=0.8
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format'
arch=('x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'cunit')
checkdepends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hoene/libmysofa/archive/v${pkgver}.tar.gz")
sha256sums=('0e0abb6ec6f5f09266325741d6ef218532187129f65d0bc6b21e155760dfb2ad')

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
    
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
