# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=1.0.0.beta1
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS-compatible media players (Linux only)"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//.beta/-beta}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-${pkgver//.beta/-beta}"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-${pkgver//.beta/-beta}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-${pkgver//.beta/-beta}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-${pkgver//.beta/-beta}"
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 