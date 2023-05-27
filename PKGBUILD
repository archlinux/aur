# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

pkgname="chuncord"
pkgver="0.2"
pkgrel=1
pkgdesc="CLI tool that allows for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/chuncord"
license=("custom:EUPLv1.2")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://git.lemonsh.moe/lemon/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('41eadca7f00e0c9394677e6163aa2f78f93c4f3eb6ad872ad870c0c412629f04')

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
