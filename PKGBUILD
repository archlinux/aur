# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=dioxus-cli
pkgver=0.4.3
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
b2sums=('b9c470ad6af0ab8158a65fe2632f307a40aadeb2f23f302688f3f6fd2b1b9de182695a31be972b9820a34b36e24a868ecb79cbfb9df7c784e335cc9e525a6585')

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
