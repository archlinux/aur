# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-string
pkgver=1.4.0
pkgrel=1
pkgdesc='Standalone library for unicode aware string support'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('cmake' 'catch2')
source=("https://github.com/copperspice/cs_string/archive/string-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f264994bb869916f59d356f451c3eecc6171565ae9bf828292bd3d7d14168db3')

build() {
    cmake -B build -S "cs_string-string-${pkgver}" \
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
    install -D -m644 "cs_string-string-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
