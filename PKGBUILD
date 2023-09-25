# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.6.2
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('any')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=() 
makedepends=(cargo)
provides=(numbat)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('5957858d63c994c5c0094c926dfe9b9230b8add389a7f3e6dd71aecee023aa7b3e3f19f39b89727545b859837fdf58367c833008f9eabefd5e4ee59c9673b55b')

prepare() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname-$pkgver/target/release/$pkgname"
}
