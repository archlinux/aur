# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.6.1
pkgrel=1
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL-2.0-or-later')
depends=(
    'fftw'
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('7065ec9db48ac1fa929ec6c42afcd966605b1bfe48b6d5e64c25378a05f4fb02')

build() {
    cmake -B build -S "chromaprint-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DFFT_LIB:STRING='fftw3' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
