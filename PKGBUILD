# Maintainer: Snehit Sah <snehitsah@protonmail.com>
pkgname=crabfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple fetch utility, written in Rust"
arch=('x86_64')
url="https://github.com/flyingcakes85/crabfetch"
license=('GPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flyingcakes85/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("35b7888c84f817276972e603f16cae4bfbbb5fb80d312936b67905b6151d084633d2064828255915803746aa875d5a2b717be5b0e17e798b3700bf126fad83f1")

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
