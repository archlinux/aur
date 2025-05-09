# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=libcotp
pkgver=3.1.0
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
sha256sums=('a48bbfd95b7ec12d23e4e2c4a017f8acddecc14bf10541ff144563cee044b39c'
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
