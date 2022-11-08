# Maintainer: Cleo <cleo@cleo.nyc>
pkgname=tidal-tdl
_pkgname=tdl
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast, Concurrent, Rust based Tidal-Media-Downloader implementation."
arch=(any)
url="https://github.com/MinisculeGirraffe/tdl"
license=('MIT')
makedepends=(cargo)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/MinisculeGirraffe/tdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('972eabe158f6563e92fcd15640067aae20527412ce4e41439134dd07658ffd9f')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}


check() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}


package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
