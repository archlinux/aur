# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.0.3
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=("any")
license=("BSD")
source=(
    "https://git.skyjake.fi/skyjake/$pkgname/releases/download/v$pkgver/lagrange-$pkgver.tar.gz"
    "lagrange.desktop"
)

depends=(
    "openssl"
    "sdl2"
    "libunistring"
    "pcre"
)
optdepends=("mpg123")
makedepends=("cmake")

build() {
    cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('17fcd774f3b54c8275b1a1c0a3a850bf'
         '1dd1255e856f3b00b822be75ec78b51b')
