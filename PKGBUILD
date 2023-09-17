# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
pkgname=rustic-rs
_pkgname=rustic
pkgver=0.5.4
pkgrel=1
pkgdesc="Fast, encrypted, deduplicated backups powered by Rust"
arch=(x86_64)
url="https://github.com/rustic-rs/rustic"
license=('GPL')
groups=()
depends=()
makedepends=(cargo)
provides=()
conflicts=()
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a19075ed60bb7f99e1dee11402ffb4a24a59b230884c06e9fd29d21c1ab6ad1e')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

