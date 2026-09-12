# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=unikmer
pkgver=0.20.0
pkgrel=1
pkgdesc="Versatile toolkit for nucleotide k-mers with taxonomic information"
arch=('x86_64')
url="https://github.com/shenwei356/unikmer"
license=('MIT')
makedepends=('go')
conflicts=('unikmer-bin')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e1513b2c01a7e04ce1041f8be3a53d209b5bee8b19a0ec7103bbd306d90abab')

build() {
    cd "$srcdir/unikmer-$pkgver/unikmer"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    export GOCACHE="$srcdir/gocache"
    export GOFLAGS=-mod=readonly
    go build -trimpath -ldflags "-s -w" -o "$srcdir/$pkgname" .
}

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/unikmer-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/unikmer-$pkgver/CHANGELOG.md" \
        "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
