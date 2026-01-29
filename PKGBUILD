# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-string
pkgver=2.0.0
pkgrel=1
pkgdesc='Standalone library for unicode aware string support'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
makedepends=('cmake') #'catch2'
source=("https://github.com/copperspice/cs_string/archive/string-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4dc01bbc3e32d264830c6a62cbf097791759311fd665c18fd67c4f196199bc6e')

build() {
    cmake -B build -S "cs_string-string-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_string-string-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
