# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=libcotp
pkgver=1.2.2
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
url="https://github.com/paolostivanin/libcotp"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libbaseencode')
makedepends=('cmake')
options=('!strip')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('25b45ffa4aece5cc689503ebea7356a2f760c194f0c41805934495d2fe7165b1'
            'SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
