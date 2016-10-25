# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.8.6
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go>=1.5' 'make')
source=("https://github.com/barnybug/cli53/archive/$pkgver.tar.gz")
sha256sums=('be1f97cf892c453410da69daa16141964d9fac6557447cadb0cb613ffe341c59')

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
