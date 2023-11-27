# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
pkgname=rustic-rs
_pkgname=rustic
pkgver=0.6.1
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
b2sums=('f65dd3bc48ff5680615e04fd11a58aa46ff21e6d710943573ce10c0953f534d47b62581da610293558b530261fd07acb9881c829dfbc4f5feeb7d55fee700475')

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

