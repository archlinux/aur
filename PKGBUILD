# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=libaxc
pkgver=0.3.1
pkgrel=1
pkgdesc="Client lib for libsignal-protocol-c"
arch=('i686' 'x86_64')
url='https://github.com/gkdr/axc'
license=('GPL3')
depends=('libsignal-protocol-c')
makedepends=()
source=("https://github.com/gkdr/axc/archive/v${pkgver}.tar.gz"
        "build-without-submodule.patch")
md5sums=('19d82eda58fa0b449accdacf73e3f447'
         'c854a97b3ade99b812bc1e6be743e848')

prepare() {
    cd "${srcdir}/axc-${pkgver}"
    patch -p1 < "${srcdir}/build-without-submodule.patch"
}

build() {
    cd "${srcdir}/axc-${pkgver}"
    make
}

package() {
    cd "${srcdir}/axc-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib"
    install build/libaxc.a "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/include/axc"
    install src/*.h "${pkgdir}/usr/include/axc"
}
