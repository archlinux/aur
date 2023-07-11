# Maintainer: Tim Dubbins <timdubbins@gmail.com>
pkgname=tap
pkgver=0.2.2
pkgrel=4
pkgdesc="An audio player for the terminal, written in rust"
arch=('x86_64')
url="https://github.com/timdubbins/tap"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('fzf: fuzzy searching' 'fd: faster find' 'skim: fzf alternative')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timdubbins/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('24ab66f58095e310a6c7648eb5243120c8f6b38487f7b906a625945e9030491f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
