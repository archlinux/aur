# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
pkgname=rustic-rs
_pkgname=rustic
pkgver=0.7.0
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
b2sums=('ef8aecdf9f66fe098a3dd5879bfb29d5ac392937765664467d844c5966d9b7f0be024ab603117ddecb638c1f101ee3d7104272c698d10add133f700c77622144')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release #--all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo test --frozen #--all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

