# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=colorize-cli
pkgver=1.0.0
pkgrel=3
pkgdesc="Colorize text in the terminal using named colors, HEX, or 256-color indexes"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/colorize-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a317c5fdf76ebc635caad28975d33bdfba407b6a9f286bd240d98f97d51883e')

build() {
    srcdir_name="$(find . -mindepth 1 -maxdepth 1 -type d | head -n 1)"

    cmake -S "$srcdir_name" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname-$pkgver/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
