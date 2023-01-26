# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>
# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver=1.2.0
pkgrel=1
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('e2e704362ddde4ec203a9f4e2eadf2af188469fa6b6c779012dbf129f933d2334e5eb93a7a98a76a39133ce840bc768627f7d71c27def8e2f8a882a5fb9a3bdd')

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
