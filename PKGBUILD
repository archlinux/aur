# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.13.6
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
    "zlib"
    "mpg123"
)
makedepends=(
    "cmake"
    "zip"
)

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

sha256sums=('7a89e4e950d14cfebd2806de07c49eeeb79368091a68ca439795d0aba9e1aaa7')
