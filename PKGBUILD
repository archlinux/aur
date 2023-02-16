# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs
_cargo_pkgname=pfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
makedepends=("cargo")
provides=("pfetch")
source=("$_cargo_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_cargo_pkgname/$_cargo_pkgname-$pkgver.crate")
b2sums=('5630a0de9011beaf618f8f72f4cff66ea7772db92a552f18389a9a59234d94c2574c7f8c7d0f30082cac4e6c536f5505588ee4e28645c5e2448c7d82a1f1532c')

prepare() {
    cd "$_cargo_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_cargo_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_cargo_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_cargo_pkgname"
}
