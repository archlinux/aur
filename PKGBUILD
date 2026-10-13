# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gradient
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI tool for playing with color gradients"
arch=(x86_64)
url="https://github.com/mazznoer/gradient-rs"
license=('Apache-2.0 OR MIT')
depends=(glibc libgcc   libgcc_s.so)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8cae074f146a9f9eba09aa8755527d1f4d3a8c6907b0e9a396b5ca2155074eeb')

prepare() {
    cd "$pkgname-rs-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-rs-$pkgver"
    cargo build --release --frozen --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-rs-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-rs-$pkgver"
    install -D target/release/gradient -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
