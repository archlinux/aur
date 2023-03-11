# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ast-grep
pkgver=0.3.2
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64')
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('31d07763aa3f335a64236424c69b2628cefae4b805e20d358c8e461a81fca4da40a383b29754b19aeb74638212c44611c5ba637955ce1e4d4edecd12d2934231')

prepare() {
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    install -Dm755 "target/release/sg" "$pkgdir/usr/bin/$pkgname"
}
