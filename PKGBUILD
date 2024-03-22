# Maintainer: Alix Bernard <alix.bernard9 at gmail dot com>

pkgname=cpu-cli-controller
pkgver=0.3.0
pkgrel=1
pkgdesc="A Linux CPU controller CLI tool"
url="https://github.com/AlixBernard/$pkgname"
license=("MIT")
makedepends=("cargo")
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlixBernard/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("90cda74beaeee9eabc6736dd48945e85f0a44c3cd234828a9c9ac9260ba5c247")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
