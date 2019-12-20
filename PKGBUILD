# Maintainer: Caesim404 <caesim404 at gmail dot com>

_basepkgname=ohlavpn
pkgname="${_basepkgname}-git"
provides=("$_basepkgname")
conflicts=("$_basepkgname")
pkgver=r14.c6c31b6
pkgrel=1
pkgdesc="Find working VPN proxy all over the world | Hola VPN"
arch=(any)
url="https://github.com/mtojek/ohlavpn"
license=(Apache)
makedepends=(git go dep)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_basepkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "gopath/src/github.com/mtojek"
    ln -rTsf "$_basepkgname" "gopath/src/github.com/mtojek/$_basepkgname"
    
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/mtojek/$_basepkgname"
    dep init
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/mtojek/$_basepkgname"
    go build .
}

package() {
    cd "$_basepkgname"
    install -Dm755 "$_basepkgname" "$pkgdir/usr/bin/$_basepkgname"
}
