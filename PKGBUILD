# Maintainer: mpalatsi <email@example.com>
pkgname=departure
pkgver=0.1.0
pkgrel=1
pkgdesc="A flexible logout application for Wayland with Material You theming support"
arch=('x86_64')
url="https://github.com/mpalatsi/departure"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mpalatsi/departure/archive/v$pkgver.tar.gz")
sha256sums=('2f20310819645dc2697af0bdf1105828e379b1a4c263d1d56fadaeec1179ff79')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/departure "$pkgdir/usr/bin/departure"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}