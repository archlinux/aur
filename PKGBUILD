# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs
_cargo_pkgname=pfetch
pkgver=2.5.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
depends=("gcc-libs" "glibc" "sqlite")
makedepends=("cargo")
provides=("pfetch")
conflicts=("pfetch-rs-bin" "pfetch" "pfetch-git")
source=("$_cargo_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_cargo_pkgname/$_cargo_pkgname-$pkgver.crate")
b2sums=('723fc2313349bcffd535dbbf130f2b0fc49a2858950e753ca3a41a5bdb726a679fa0e6d11b370488ac817863cd563b7d63d28a57dfbda54728907a555c967972')

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
