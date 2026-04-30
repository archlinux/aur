# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=chess-cat
pkgver=0.1.0
pkgrel=1
pkgdesc=' Visualize chess boards in your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/ptsouchlos/chess-cat'
license=('MIT')
makedepends=('cargo')
provides=('chess-cat')
conflicts=('chess-cat-git' 'chess-cat-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3a8198d50e83fe7b0b6ac59a86ef6100db1298ca65d9c73d3c0a9405c28701d2')

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
    install -Dm0755 target/release/chess-cat "$pkgdir/usr/bin/chess-cat"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
