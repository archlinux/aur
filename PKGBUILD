# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.7.1
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=("BSD")
install="$pkgname.install"
source=(
    "https://git.skyjake.fi/skyjake/$pkgname/releases/download/v$pkgver/lagrange-$pkgver.tar.gz"
)

depends=(
    "fribidi"
    "harfbuzz"
    "hicolor-icon-theme"
    "libunistring"
    "openssl"
    "pcre"
    "sdl2"
)
optdepends=("mpg123")
makedepends=("cmake")

build() {
    cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_KERNING=OFF \
        -DTFDN_ENABLE_WARN_ERROR=OFF \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="$pkgdir" install
}

sha256sums=('f43800fbfa99c15233a5dc5333f6d981b9a6139ff354c664213a04b3d6250703')
