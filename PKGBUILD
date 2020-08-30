# Maintainer: Timur Demin <me@tdem.in>

pkgname="syg_go"
pkgver="0.1.3"
pkgrel=1
pkgdesc='Yggdrasil address miner written in Go'

url="https://git.tdem.in/tdemin/syg_go"
arch=('any')
license=('LGPL3')
makedepends=(
    'git'
    'go'
)

_gopkg="git.tdem.in/tdemin/syg_go"

prepare () {
    rm -rf "$srcdir"/{bin,pkg,src}
    git clone --branch "v$pkgver" --depth 1 "$url" "$srcdir/src/$_gopkg"
}

build () {
    GOPATH="$srcdir" go get -v "$_gopkg"
}

check () {
  (cd "$srcdir/src/$_gopkg" && go test ./...)
}

package () {
    local _tree="$srcdir/src/$_gopkg"
    install -p -m 755 -D -t "$pkgdir/usr/bin/" "$srcdir/bin/$pkgname"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/" "$_tree/README.md"
}
