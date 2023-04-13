# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

pkgname="chuncord"
pkgver="0.1"
pkgrel=1
pkgdesc="CLI tool that allows for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/chuncord"
license=("custom:EUPLv1.2")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://git.lemonsh.moe/lemon/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a6b0806d550a288f4f631b8d22185f343ef7b29e6de53bef675cdf596faa83d6')

prepare() {
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
