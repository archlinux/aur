# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-parallel
pkgver=1.13.1
pkgrel=1
pkgdesc='Fast parallel command runner, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/aaronriekenberg/rust-parallel'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6bc1d6c69cca64a6ff9aed251337de01bbacdc17e2d21ed799ea30eae4bd24af')


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

    # /usr/share/licenses/spdx/Apache-2.0.txt
    # install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

