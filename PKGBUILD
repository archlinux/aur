# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.5.0
pkgrel=1
pkgdesc='Extracts fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL')
makedepends=('cmake' 'gtest')
depends=('fftw')
provides=('chromaprint')
conflicts=('chromaprint')
source=("chromaprint-${pkgver}.tar.gz"::"https://github.com/acoustid/chromaprint/archive/v${pkgver}.tar.gz")
sha256sums=('5c8e0d579cb3478900699110aa961c1552a422a18741cf67dd62136b1b877c7b')

build() {
    cmake -B build -S "chromaprint-${pkgver}" \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DFFT_LIB:STRING='fftw3' \
        -Wno-dev
    make -C build
}

check() {
    make -C build check
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
