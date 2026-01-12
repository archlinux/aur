# Maintainer: SchweGELBin <schwegelbin@gmail.com>

pkgname=catspeak
pkgver=1.2.3
pkgrel=2
pkgdesc="Cowsay like program of a speaking cat"
url="https://github.com/SchweGELBin/catspeak"
license=('MIT')
makedepends=('cargo')
arch=('x86_64' 'aarch64')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('393879f16e385a28d80cbd10c35d65b8e56b7de1c3798cce792e25901a88c451')

prepare() {
    if [ -d "$srcdir/$pkgname-$pkgver" ]; then cd "$srcdir/$pkgname-$pkgver"; fi
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    if [ -d "$srcdir/$pkgname-$pkgver" ]; then cd "$srcdir/$pkgname-$pkgver"; fi
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    if [ -d "$srcdir/$pkgname-$pkgver" ]; then cd "$srcdir/$pkgname-$pkgver"; fi
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    if [ -d "$srcdir/$pkgname-$pkgver" ]; then cd "$srcdir/$pkgname-$pkgver"; fi
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
