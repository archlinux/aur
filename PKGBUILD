# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=berserk
pkgver=13
pkgrel=1
pkgdesc="UCI compliant chess engine written in C"
arch=(x86_64)
url='https://www.chessengeria.eu/berserk'
license=('GPL3')
depends=(glibc)
makedepends=(clang)
checkdepends=(expect)
options=(!strip)
_main_network='d43206fe90e4'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhonnold/berserk/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/jhonnold/berserk/releases/download/${pkgver}/berserk-${_main_network}.nn")
sha512sums=('93a76a1039f019354beee8ffbfee5177e390a0c91cf2e6e05a3b7d4922f4388a2b42196dd4d774be3f13739fca0430b829e284d6c80ab4f07efe786402f2521a'
            '9246815caf76127a2c10951adc478f04f7d535a97d785ec6eca8fc1bce770e31a7e9aaedfc9c9274ea6b8a5b115473b9a68b1ee83dd2a81cdcfeccba07588e85')

prepare() {
    ln -sf "${srcdir}/berserk-${_main_network}.nn" "${pkgname}-${pkgver}/src/main_network.nn"
}

build() {
    cd "${pkgname}-${pkgver}"
    cd src
    make EVALFILE="main_network.nn" build
}

check() {
   cd "${pkgname}-${pkgver}"
   ./tests/perft.sh
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/berserk" "${pkgdir}/usr/bin/${pkgname}"
}
