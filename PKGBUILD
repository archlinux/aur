# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded
pkgver=1.1.0
pkgrel=1
pkgdesc='Header only library for multithreaded programming'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
checkdepends=('boost')
source=("https://github.com/copperspice/cs_libguarded/archive/libguarded-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad51992e5a8ba29ce55e7bd6dfb653f4b483a52edf07806871e8b15e67278af3')

prepare() {
    autoreconf -fi "cs_libguarded-libguarded-${pkgver}"
}

build() {
    cd "cs_libguarded-libguarded-${pkgver}"
    ./configure --prefix='/usr' --enable-static='no'
    make
}

check() {
    make -C "cs_libguarded-libguarded-${pkgver}" check
}

package() {
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/src/libguarded"/*.hpp -t "${pkgdir}/usr/include/libguarded"
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
