# Maintainer: Ashen Chathuranga ktauchathuranga@gmail.com
pkgname=stickee
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple sticky notes application for Arch Linux"
arch=('x86_64')
url="https://github.com/ktauchathuranga/stickee"
license=('MIT')
depends=('gtk4')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ktauchathuranga/stickee/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') 

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
