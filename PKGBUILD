# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded
pkgver=1.3.0
pkgrel=1
pkgdesc='Header only library for multithreaded programming'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('cmake' 'catch2')
source=("https://github.com/copperspice/cs_libguarded/archive/libguarded-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4059db286bb6386faa748cdcdb53c0e5ce785ca3644fb4a01410011b8ea97be2')

build() {
    cmake -B build -S "cs_libguarded-libguarded-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
