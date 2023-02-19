# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs
_cargo_pkgname=pfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
makedepends=("cargo")
provides=("pfetch")
conflicts=("pfetch-rs-bin" "pfetch" "pfetch-git")
source=("$_cargo_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_cargo_pkgname/$_cargo_pkgname-$pkgver.crate")
b2sums=('61a0d39d11a33c1661fe632cc7575b53d0f5e4b7448270915c9e06e1c794b876a695aca1847570549fec6632bec86ca1101a3024db5c794007bcbc8c0c671f9e')

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
