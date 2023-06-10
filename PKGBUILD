# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

pkgname="chuncord"
pkgver="0.2.1"
pkgrel=2
pkgdesc="CLI tool for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/chuncord"
license=("custom:EUPLv1.2")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://git.lemonsh.moe/lemon/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2866a4f1557ed36ec618cdb25e0def81441969cb6464b7ae1e0f44880e76e192')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
