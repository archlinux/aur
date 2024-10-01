# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
pkgname="objdiff"
pkgver=2.2.1
pkgrel=1
pkgdesc="A local diffing tool for decompilation projects"
arch=("x86_64")
url="https://github.com/encounter/$pkgname"
license=("Apache-2.0 OR MIT")
depends=(
    "fontconfig"
    "freetype2"
)
makedepends=("cargo")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('06928d3464233c169b58598cd9c7ecdd4567399cff5cb8ffb5637ca82736e51704952a403c3ed2e250689b2c6c147a5fa7e6a78be3ab08d9934668df8b12712b')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --target-dir="target"
}

package () {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname-cli" -t "$pkgdir/usr/bin/"
    install -Dm644 "$pkgname-$pkgver/LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
