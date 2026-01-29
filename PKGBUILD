# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-crypto
pkgver=1.1.0
pkgrel=1
pkgdesc='C++ interface for calling existing cryptography libraries'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
makedepends=('cmake' 'catch2-v2')
source=("https://github.com/copperspice/cs_crypto/archive/crypto-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3ecbed30cde1bfca8d1a047020ad52df1702551773f6f6672095af2673bd1cc2')

build() {
    cmake -B build -S "cs_crypto-crypto-${pkgver}" \
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
    install -D -m644 "cs_crypto-crypto-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
