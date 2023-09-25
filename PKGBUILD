# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=dioxus-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool for developing, testing, and publishing Dioxus apps"
url="https://github.com/DioxusLabs/dioxus/"
license=("MIT" "Apache")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
depends=()
makedepends=("cargo")
provides=("dx")
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('55c0a9371a08370c24cc0af596d69943707fc7c356c570cbb83e2110ceb59c6fc6bdf6e50bb87f8fba367396ad55f4b2508e0e07cb4687c63675fb395bc5fe8f')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/dx"
}
