# Maintainer: Polarian <polarian@polarian.dev>

pkgname="davis"
pkgver="0.1.3"
pkgrel=1
pkgdesc="CLI client for mpd, written in rust"
arch=("x86_64")
url="https://github.com/SimonPersson/davis"
license=("GPL3")
makedepends=("cargo")
optdepends=("mpd: Music daemon davis interfaces with")
source=("davis-$pkgver.tar.gz::https://github.com/SimonPersson/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ed85fbc7bd74b4f355aa6fd5b1956bc8c4c4da1041396b1a2af9d507866e95a')

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
