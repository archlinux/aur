# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs
_cargo_pkgname=pfetch
pkgver=2.11.1
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
b2sums=('1368bab809a78860cbeeeba3d9d43b157215785826537a96dd29cf69a443a5fe29f22a22b27bb3441a2518e596a2ec9c7abd94bec4f0eefff3bfdddbdd2639f2')

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
