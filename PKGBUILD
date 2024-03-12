# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>

pkgname=cdwifi
pkgver=0.1.2
pkgrel=1
epoch=1
pkgdesc="Simple login script for public WiFi in ČD trains"
arch=('any')
url="https://github.com/MaximMaximS/CDWiFi"
license=('MIT-0')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=("178c78c98526d32fb8f075f21615b2ea6cd0ac3ed31c9ab8a6cde7d327666a60")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --release --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
