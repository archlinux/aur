# Maintainer: Dhanushka Jayagoda <dhanushka2001 [at] gmail [dot] com>

pkgname=citeorder
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple command-line tool to relabel footnotes in Markdown files in numerical order"
arch=('x86_64')
url="https://github.com/dhanushka2001/citeorder"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('772bd81c56020c9f7eab485bb01f821079eb393cacedd6afe55c999fc7de3494')

build() {
    cd "$srcdir"

    mkdir build
    cp "$pkgname-$pkgver/citeorder.c" build/
    cp "$pkgname-$pkgver/README.md" build/
    cp "$pkgname-$pkgver/LICENSE" build/
    cp "$pkgname-$pkgver/citeorder.1" build/

    cd build
    cc -O2 -o citeorder citeorder.c
}

package() {
    cd "$srcdir/build"
    install -Dm755 citeorder "$pkgdir/usr/bin/citeorder"
    install -Dm644 citeorder.1 "$pkgdir/usr/share/man/man1/citeorder.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
