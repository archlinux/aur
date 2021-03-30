# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.2.3
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64' 'i686' 'aarch64')
license=("BSD")
source=(
    "https://git.skyjake.fi/skyjake/$pkgname/releases/download/v$pkgver/lagrange-$pkgver.tar.gz"
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
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="$pkgdir" install
}

sha256sums=('a2d479ed68bf0f8f8f13241f1e5b7a4d9be2097200c51cfc4d9a7a2f6da12546')
