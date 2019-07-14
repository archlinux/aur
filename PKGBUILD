# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=chromaprint-fftw
pkgver=1.4.3
pkgrel=5
pkgdesc='Extracts fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL')
makedepends=('cmake' 'gtest')
depends=('fftw')
provides=('chromaprint')
conflicts=('chromaprint')
source=("chromaprint-${pkgver}.tar.gz"::"https://github.com/acoustid/chromaprint/archive/v${pkgver}.tar.gz")
sha256sums=('d4ae6596283aad7a015a5b0445012054c634a4b9329ecb23000cd354b40a283b')

build() {
    cd "chromaprint-${pkgver}"
    
    cmake \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DFFT_LIB:STRING='fftw3' \
        -Wno-dev \
        .
        
    make
}

check() {
    cd "chromaprint-${pkgver}"
    
    make check
}

package() {
    cd "chromaprint-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
