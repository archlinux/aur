# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel
pkgver=1.16.0
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f8bfb69a277cef123a56b05baeaf9fdbb65f936a1dfe056457c58ea6afacb7c')


prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

    install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

