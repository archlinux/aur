# Maintainer: Polarian <polarian@polarian.dev>

pkgname="davis"
pkgver="0.1.0"
pkgrel=1
pkgdesc="CLI client for mpd, written in rust"
arch=("x86_64")
url="https://github.com/SimonPersson/davis"
license=("GPL3")
depends=("mpd")
makedepends=("cargo")
source=("davis-$pkgver.tar.gz::https://github.com/SimonPersson/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ee37d3e1439e74713dab6efc449007224f4457993001943ab93f47d579eb25b')

prepare() {
    cd "davis-$pkgver" && cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "davis-$pkgver" && cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "davis-$pkgver/target/release/davis" "$pkgdir/usr/bin/davis"
}
