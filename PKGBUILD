# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_abseil_ver=20200225.2

pkgname=libgav1
pkgver=0.16.0
pkgrel=2
pkgdesc='A main profile (0) and high profile (1) compliant AV1 decoder'
arch=('x86_64')
url='https://chromium.googlesource.com/codecs/libgav1/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+https://chromium.googlesource.com/codecs/libgav1#tag=v${pkgver}"
        "git+https://github.com/abseil/abseil-cpp.git#tag=${_abseil_ver}")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    mkdir -p libgav1/third_party
    ln -sf ../../abseil-cpp libgav1/third_party/abseil-cpp
}

build() {
    cmake -B build -S libgav1 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLIBGAV1_ENABLE_SSE4_1:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
