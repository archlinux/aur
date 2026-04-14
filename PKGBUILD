# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tomlq
pkgver=0.2.2
pkgrel=1
pkgdesc='Tool for getting data from TOML files'
arch=('x86_64')
url='https://github.com/cryptaliagy/tomlq'
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
provides=('tq' 'tq-rs')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2a9cff8827dd0d3213470e9a333645492c4d8fe0a733439cc42db4c7b1fc6292')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/tq -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}

