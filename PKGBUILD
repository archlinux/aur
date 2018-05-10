# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=libcotp
pkgver=1.0.12
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
arch=('i686' 'x86_64')
depends=('libbaseencode')
makedepends=('cmake')
url="https://github.com/paolostivanin/libcotp"
options=('!strip')
license=('GPL3')

source=("$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")

validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')

sha256sums=("20b40bf57a987824df2b3dec9816303eca8b6e6a1bd29b31f43200f4bdd1652e"
            "SKIP")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build && cd $_
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
