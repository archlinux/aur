# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=pixterm-git
_gitname=pixterm
pkgver=v1.1.1.r0.g0604f32
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
    git describe --long --tags \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
