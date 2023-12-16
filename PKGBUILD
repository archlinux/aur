# Maintainer: pikl <me@pikl.uk>
pkgname=pgvecto.rs
pkgver=0.1.12
pkgrel=1
pkgdesc="Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx."
arch=(x86_64)
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache-2.0')
groups=()
depends=()
makedepends=(cargo)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tensorchord/pgvecto.rs/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('fca3535ddb8afed734fd5d78153f07ec09c45a044991de189f4d865f0ba402ac')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    # export RUSTUP_TOOLCHAIN=stable
    # export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    # export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
