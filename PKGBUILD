# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Maintainer: KingofToasters <dev@sgregoratto.me>
pkgname=libcotp
pkgver=1.2.4
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
url="https://github.com/paolostivanin/libcotp"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libbaseencode' 'libgcrypt')
makedepends=('cmake')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('6a077c6a8e785a542262f207fbb760f3d7d03649787c10cb01ea38c280dda070'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
