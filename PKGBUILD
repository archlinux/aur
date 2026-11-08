# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=2.0.1
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=("MIT")
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
    "sdl3"
    "zlib"
    "mpg123"
)
makedepends=(
    "cmake"
    "zip"
)
optdepends=(
    "libwebp: Webp decode support"
    "libjxl: JPEG XL image decoding"
)

build() {
    cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_KERNING=OFF \
        -DTFDN_ENABLE_WARN_ERROR=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="$pkgdir" install
}

sha256sums=('abac39d4aff9716c9d4b3b10f85e83d762f8896ad83c1ffda74c7ed4b6521cfd')
