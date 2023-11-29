# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=libcotp
pkgver=2.1.0
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
url="https://github.com/paolostivanin/libcotp"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libgcrypt')
makedepends=('cmake')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('170fd3ee5270cc2bf78e76950dc64f400143da849942763abeb07e6c40c69325'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build . --target all
}

package() {
    cd "$pkgname-$pkgver/build"
    cmake --install . --prefix="$pkgdir/usr"
}
