# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=nixpkgs-fmt
pkgver=1.3.0
pkgrel=2
pkgdesc="Nix code formatter for nixpkgs"
arch=('x86_64' 'aarch64')
url="https://github.com/nix-community/nixpkgs-fmt"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
backup=()
options=()
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('a04b99a8aa9d162ba5da77a764915a4d8385492a40169c419dc5fc7af606b89a')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
