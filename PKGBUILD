# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=dioxus-cli
pkgver=0.5.7
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
b2sums=('55f602db31d023c5973e8e6dd7b232c6c03eeb7a8429238448b50829f20046f88d47c3d0f52279001190701535f4f5bd8b7c736fefa62dc61c4c562c356aedef')

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
