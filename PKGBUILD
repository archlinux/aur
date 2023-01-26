# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>
# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver=1.0.0
pkgrel=1
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('5573abbce5b5d06a5ee1d97a7b64c6f61d7591ec0b1741d6dcb5eaf6da89fe8b32e338121c0d1077c02726baad428e9b296b3dde0289eb390538ade25f7c1b04')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
