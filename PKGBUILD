# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal
pkgver=1.3.0
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'catch2' 'cs-libguarded')
source=("https://github.com/copperspice/cs_signal/archive/signal-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8eb7098e21cd2bc65152c21e4a98e94bb422d78844ceead5b4bec4208157d90a')

build() {
    cmake -B build -S "cs_signal-signal-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_signal-signal-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
