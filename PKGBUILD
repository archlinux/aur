# $Id$
# Maintainer: Radu Potop <radu at wooptoo com>

pkgname=formatjson
pkgver=0.3.1
pkgrel=1
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

sha256sums=('870d5703e19be4046e13cb8ab8a6ada5f1569cda68fbeca2dbbc0e57b7483fe9')
