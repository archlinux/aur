# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.8.0
pkgrel=2
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go>=1.5' 'make')
source=("https://github.com/barnybug/cli53/archive/$pkgver.tar.gz")
sha256sums=('0a87de05110d9bba851ba3522a1072494256e31fa653f59331313bff21d5c160')

build() {
    export GOPATH="$srcdir"
    rm -rf "$srcdir/src/github.com/barnybug/cli53"
    mkdir -p "$srcdir/src/github.com/barnybug"
    ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/barnybug/cli53"
    cd "$srcdir/src/github.com/barnybug/cli53"
    make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
