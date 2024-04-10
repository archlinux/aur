# $Id$
# Maintainer: Radu Potop <radu at wooptoo com>

pkgname=formatjson
pkgver=0.2.0
pkgrel=2
pkgdesc="JSON validator and formatter written in Rust"
arch=('x86_64')
url="https://github.com/tusharsadhwani/formatjson"
license=('MIT')
depends=('gcc-libs' 'rust')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # documentation
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

    # licenses
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICEN[CS]E
}

sha256sums=('1c7d4e9b68376d1b8cd145e11ffbc3ff00f495815dd31e0b6ffc1d2e07f2a805')
