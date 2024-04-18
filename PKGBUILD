pkgname=chess-tui
pkgver=1.2.1
pkgrel=1
pkgdesc="A chess TUI implementation in rust 🦀"
arch=('any')
url="https://github.com/thomas-mauran/chess-tui"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('cfbbf8935ee072ac05b4d7e51960eeb71ddf385256a6072c678a374af39540a8')
makedepends=('cargo')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
