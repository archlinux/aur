# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=dioxus-cli
pkgver=0.5.6
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
b2sums=('4cdb252fc612948dc670e8150050387d61fd176df11c2f9441338fc4f5c3f24f9e839842c9279d25d7ce3997fa2c9cf66e1af154bb633c58abe227805ca0d6e1')

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
