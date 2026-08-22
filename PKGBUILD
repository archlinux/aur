# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=xwayclip
_pkgver=0.2.2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Bidirectional clipboard synchronization between X11 and Wayland for poorly implemented apps like Linux QQ'
arch=('x86_64')
url='https://github.com/so1ve/xwayclip'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('c21b7c6e417e3b63d39a131d407b3318afe275555d709a6464bb2ff01201450e')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH"
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
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/xwayclip -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
