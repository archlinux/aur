# Maintainer: TarkoGabor (@tgabor7)
pkgname=simplelock
pkgver=0.0.0
pkgrel=1
pkgdesc="A very simple screen locker for Wayland"
arch=('x86_64')
url="https://github.com/tgabor7/sl"
license=('BSD')
depends=('wayland' 'wayland-protocols' 'cargo')
source=("sl-$pkgver-linux.tar.gz::https://github.com/tgabor7/sl/archive/tags/v$pkgver.tar.gz")
md5sums=('c623351938306b5c437aa1d680004dab')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
