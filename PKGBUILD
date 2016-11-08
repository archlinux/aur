# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=pipeline-git
_pkgname=pipeline
pkgver=r25.02303e6
pkgrel=1
pkgdesc="A tool to help with quick iteration on complex shell pipelines."
arch=('i686' 'x86_64')
url="https://github.com/skelterjohn/pipeline"
license=('Apache')
depends=()
makedepends=('go' 'git')
source=($pkgname::git+https://github.com/skelterjohn/pipeline)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
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
}

# vim:ft=sh

