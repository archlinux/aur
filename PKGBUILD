# Maintainer: Salamandar <felix@piedallu.me>

pkgname=pylyzer
pkgver=0.0.10
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python'
arch=('any')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
makedepends=(
    'cargo'
)
depends=(
)

source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'ea128f190391b1e98841eb371121630399971095dea5e42e7b5c09c2e1a7f518'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
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

package () {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
