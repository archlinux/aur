# $Id$
# Maintainer: Radu Potop <radu at wooptoo com>

pkgname=formatjson
pkgver=0.3.2
pkgrel=1
pkgdesc="JSON validator and formatter written in Rust"
arch=('x86_64')
url="https://github.com/tusharsadhwani/formatjson"
license=('MIT')
depends=('gcc-libs' 'rust')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cd59ccd6f2c7ee9b191339c0aa9e48482a9c4cc3837af7fb08b5c357b63dd7c7')

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
