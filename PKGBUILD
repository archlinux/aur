# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded
pkgver=1.4.0
pkgrel=1
pkgdesc='Header only library for multithreaded programming'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('cmake' 'catch2')
source=("https://github.com/copperspice/cs_libguarded/archive/libguarded-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3911c56db6e7b222e2ec4c45513021f819ce647e7e6e803ca64dc720e8645d8e')

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
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
