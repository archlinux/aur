# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=1.27.11
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ec668eac8110721b772926b1e61125a26c9ebf5f29731954854ad3d171e615b8b806b1671bd5e07831f28c3ccadd9b6dbb3feb29ed692c49cfcb578d80f4da7e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./target/release/rtx --version
}
