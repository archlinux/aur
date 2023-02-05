# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-crypto
pkgver=1.0.1
pkgrel=1
pkgdesc='C++ interface for calling existing cryptography libraries'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('cmake' 'catch2')
source=("https://github.com/copperspice/cs_crypto/archive/crypto-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('811e448fb921f1b80a2720cb382142037ab3e1797e6b1dbac6e0480bd349bb08')

build() {
    cmake -B build -S "cs_crypto-crypto-${pkgver}" \
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
    install -D -m644 "cs_crypto-crypto-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
