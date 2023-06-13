# Maintainer: Tim Dubbins <timdubbins@gmail.com>
pkgname=tap
pkgver=0.1.1
pkgrel=1
pkgdesc="An audio player for the terminal, written in rust"
arch=('x86_64')
url="https://github.com/timdubbins/tap"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('fzf: fuzzy searching' 'fd: faster find' 'skim: fzf alternative')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timdubbins/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4051069fcfbc1ef993e160c36d92fd1c733841312e482b2d1eaa7e22d0bc431a')

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
