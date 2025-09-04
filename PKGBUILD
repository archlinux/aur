# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.6.0
pkgrel=1
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL-2.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'fftw')
makedepends=(
    'cmake')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('65bfce4a35b2e673dbcda917b6aa577e2f145cf805243d19e6a50fea2a520c2a')

build() {
    cmake -B build -S "chromaprint-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DFFT_LIB:STRING='fftw3' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
