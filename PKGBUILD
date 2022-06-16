# Maintainer: somini <dev@somini.xyz>
pkgname=pw-volume
pkgver=0.3.0
pkgrel=1
pkgdesc="Basic interface to PipeWire volume controls"
arch=("x86_64")
url="https://github.com/smasher164/pw-volume"
license=('MIT')
depends=('pipewire')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce1d161856bc8e33c76447198122fd61b60f30670f705229b0a2c431bc20b14d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
