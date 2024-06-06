# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=dioxus-cli
pkgver=0.5.4
pkgrel=2
pkgdesc="CLI tool for developing, testing, and publishing Dioxus apps"
url="https://github.com/DioxusLabs/dioxus/"
license=("MIT" "Apache")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
depends=()
makedepends=("cargo")
provides=("dx")
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('66d7f95f9fd157ac3b0b928d48f167c688f4b64a7d21754cbbb1aa194f273b8b0ceaec85610b9fb3396eb65a38e7e72f401ac400cda55f61e7138942fe488cc2')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/dx"
}
