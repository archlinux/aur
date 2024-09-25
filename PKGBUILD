# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded
pkgver=1.4.2
pkgrel=1
pkgdesc='Header only library for multithreaded programming'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
makedepends=('cmake')
source=("https://github.com/copperspice/cs_libguarded/archive/libguarded-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d04b84c1e53e24d42eaa41e0c96897a3f358677154178673cfe12e2ad75a06c2')

build() {
    cmake -B build -S "cs_libguarded-libguarded-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
