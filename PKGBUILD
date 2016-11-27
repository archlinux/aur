# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=pxl-git
_pkgname=pxl
pkgver=r20.9c3ae93
pkgrel=1
pkgdesc="A little hack to display images in the terminal"
arch=('i686' 'x86_64')
url="https://github.com/ichinaski/pxl"
license=('custom')
depends=()
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/ichinaski/pxl")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "$srcdir/go"
    export GOPATH="$srcdir/go"
    go get github.com/nsf/termbox-go
}

build() {
    cd "$pkgname"
    go build
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:ft=sh

