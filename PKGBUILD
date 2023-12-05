# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>
# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver=1.3.0
pkgrel=1
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('4006b6a02df2d1aeb77d1c694d42884aae81dff31d1129a3b7d20b3053b9e413a3e9457c21983fdd075b6e18b62da1e7b7f4535d0a870aa86d51f0af3a95d2d4')

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
