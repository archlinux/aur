# Maintainer: Miel Peeters <peetersmiel@gmail.com>
pkgname=folio_tui
pkgver=0.1.2
pkgrel=1
pkgdesc="TUI client for folio social network"
arch=('x86_64' 'aarch64')
url="https://github.com/foliofolio/folio_tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b525882148894652c7da5817acf08c254b529673d8712000bc336a28732b743')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/folio" "$pkgdir/usr/bin/folio"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
