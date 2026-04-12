# Maintainer: Darren Chauvet (not1.618)
pkgname=shellcap
pkgver=0.1.0
pkgrel=1
pkgdesc="A passive terminal activity tracker that summarizes what you did yesterday"
arch=('x86_64' 'aarch64')
url="https://github.com/NOT16180/recap"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f4fc1a36a0bff5412cf23dc7a4b4d8e85e3da265f04293bfc07547c16e629c25')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/recap" "$pkgdir/usr/bin/recap"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
