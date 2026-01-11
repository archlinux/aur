# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qs
pkgver=0.1.1
pkgrel=1
pkgdesc='Library for encoding and decoding quadraphonic audio in QS Regular Matrix format'
arch=('any')
url='https://github.com/quarkquad/qs/'
license=('Apache-2.0')
makedepends=(
    'catch2'
    'cmake'
    'flac'
    'juce'
    'libvorbis')
source=("https://github.com/quarkquad/qs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f1acf8be8f153548912acad332ae5756fd1d6a1cc396655dfd518e5fb33dace9')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DQS_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
