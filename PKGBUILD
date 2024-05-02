# Maintainer: Snehit Sah <snehitsah@protonmail.com>
pkgname=crabfetch
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple fetch utility, written in Rust"
arch=('x86_64')
url="https://github.com/flyingcakes85/crabfetch"
license=('GPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flyingcakes85/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a57ed1ee92e812d8bf24c331d8381437395cc9af35056e8bb62f54d2c33c4df4f02ad1d214565d0f3b04203216024308e1e2d4f449058f60f81abe9b2da8a351')

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
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
