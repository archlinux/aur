# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.7.4
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go>=1.5', 'make')
source=("https://github.com/barnybug/cli53/archive/$pkgver.tar.gz")
sha256sums=('3cb89e6aa91676ffd0577798a4b06b056667d18ad836de4fa31c0564ee48474e')

build() {
    export GOPATH="$srcdir"
    rm "$srcdir/src/github.com/barnybug/cli53"
    mkdir -p "$srcdir/src/github.com/barnybug"
    ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/barnybug/cli53"
    cd "$srcdir/src/github.com/barnybug/cli53"
    make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
