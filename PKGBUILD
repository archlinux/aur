pkgname=aev
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal fast system fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/azytar/aev"
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

options=('!debug')

source=("$pkgname-$pkgver.tar.gz::https://github.com/azytar/aev/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('954675f6295cd49661ebf78f000317a6b743ce613f6d16986a62dd547f8282f1')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/aev \
        "$pkgdir/usr/bin/aev"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
