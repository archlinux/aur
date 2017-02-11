# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=pixterm-git
_gitname=pixterm
pkgver=r9.0604f32
pkgrel=1
pkgdesc="Draw images in your ANSI terminal with true color"
arch=(x86_64 i686)
url=https://github.com/eliukblau/pixterm
license=(MPL)
makedepends=(git go)
provides=(pixterm)
conflicts=(pixterm)
source=(git+https://github.com/eliukblau/pixterm)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    # No tagged commits. ヽ(´ー｀)ノ
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

build() {
    cd "$srcdir/$_gitname"
    export GOPATH="$srcdir/gopath"
    [ -d "$GOPATH" ] || mkdir "$srcdir"/gopath
    go get -d
    go build
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 pixterm "$pkgdir/usr/bin/pixterm"
}
