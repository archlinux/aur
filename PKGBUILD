# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=cargo-wizard
pkgver=0.2.1
pkgrel=1
pkgdesc='Cargo subcommand for configuring Cargo profile'
arch=('x86_64' 'aarch64')
url='https://github.com/Kobzol/cargo-wizard'
license=('MIT')
makedepends=(cargo)
conflicts=(cargo-wizard-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee030fd78d403b37dbfb971a6c0a98c173a8e4ec92c877ee1a00c2bd9ffe6f7a')

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

    cargo test --frozen --all
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm 755 "target/release/cargo-wizard" -t "$pkgdir/usr/bin"

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
