# Maintainer: CaSilicate <casilicate@outlook.com>

pkgname=eyefuck_language
pkgver=0.1.0
pkgrel=1
pkgdesc="Compiler of eyefuck Programming Language"
arch=('x86_64')
url="https://github.com/CaSilicate-dev/eyefuck_language"
license=('MIT')
depends=('gcc')
makedepends=('cargo')
source=("https://github.com/CaSilicate-dev/eyefuck_language/archive/refs/tags/0.1.0.tar.gz")
sha256sums=('4d7ecfced49a71d5a823ec3aa9f92f5d1874a409db405f8a6b2a899d6f69fc78')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/eyefuck"
}
