# Maintainer: Vinkoplay
pkgname=hsf
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast and secure /etc/hosts manager written in Rust"
arch=('x86_64')
url="https://github.com/vinkoplay/hsf"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust' 'cargo' 'nasm')
options=('!lto')
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93c18f53822c774e3a433fe2935dd8031630729bb0dd6d405cd6b63a78dc1a5e')

build() {
    cd "$srcdir/${pkgname%-git}"
    export CARGO_HOME="$srcdir/cargo-home"
    export CC=gcc
    export CFLAGS="$CFLAGS -fPIC"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    install -Dm755 "target/release/hsf" "$pkgdir/usr/bin/hsf"
    install -Dm644 "hsf.1" "$pkgdir/usr/share/man/man1/hsf.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
