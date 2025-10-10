# Maintainer: Dhanushka Jayagoda <dhanushka2001 [at] gmail [dot] com>
pkgname=citeorder
pkgver=1.1
pkgrel=1
pkgdesc="Simple command-line tool to reorder footnotes in Markdown files"
arch=('x86_64')
url="https://github.com/dhanushka2001/citeorder"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0afcb3f7e63f159f75b299485353ff839bf8c35e933d6e58c4fc01f6347aeb15')

build() {
    cd "$srcdir"

    # create temporary build folder
    mkdir build
    cp "$pkgname-$pkgver/citeorder.c" build/
    cp "$pkgname-$pkgver/README.md" build/
    cp "$pkgname-$pkgver/LICENSE" build/
    cp "$srcdir/citeorder.1" build/       # man page from local AUR folder

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
