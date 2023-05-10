# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Max Niederman <max@maxniederman.com>
pkgname=ttyper
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal-based typing test."
url="https://github.com/max-niederman/ttyper"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
makedepends=("cargo")
provides=("ttyper")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('2d423fa4ce3d1ac09fbd25cedbe25d527ff7a5673fc1b60f681f5bcdd4a3855689a40fd60f16737424fa1b8eba651fb6818a0bd56d214891a9805e2069801dea')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
