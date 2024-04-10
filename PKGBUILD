# $Id$
# Maintainer: Radu Potop <radu at wooptoo com>

pkgname=formatjson
pkgver=0.2.0
pkgrel=1
pkgdesc="JSON validator and formatter written in Rust"
arch=('x86_64')
url="https://github.com/tusharsadhwani/formatjson"
license=('MIT')
depends=('gcc-libs' 'rust')
makedepends=('cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # documentation
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

    # licenses
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICEN[CS]E
}
