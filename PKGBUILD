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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v1.0.0-beta1.tar.gz")
sha256sums=('38dcc5f27786375c2b42e517451e2f510c0992d56ea2c9c1ca00fffb7a68f05a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
