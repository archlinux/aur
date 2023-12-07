pkgname=chess-tui
pkgver=1.0.1
pkgrel=2
pkgdesc="A chess TUI implementation in rust 🦀"
arch=('any')
url="https://github.com/thomas-mauran/chess-tui"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('1895b89877744393e4e22de3ecb69d368c827ec4e2a9cdb33e64766e1e1f9328')
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
