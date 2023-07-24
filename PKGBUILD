# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal
pkgver=1.3.1
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'catch2' 'cs-libguarded')
source=("https://github.com/copperspice/cs_signal/archive/signal-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c64c6e087aafead506d94e9d730d6a3505f29ce0c23ef4787d5bd39b66313a11')

build() {
    cmake -B build -S "cs_signal-signal-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_signal-signal-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
