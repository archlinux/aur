# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg="gbt"
_gopkg="github.com/jtyr/$_pkg"

pkgname="$_pkg-git"
pkgver=r6.2d36a5a
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Go'
url="https://github.com/jtyr/gbt"
arch=('any')
license=('MIT')
makedepends=('go')
optdepends=('nerd-fonts-complete')
source=()
sha256sums=()


pkgver() {
    msg2 'Getting version'
    cd "$srcdir/src/$_gopkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    msg2 'Fetching Go package'
    GOPATH="$srcdir" go get -u "$_gopkg"
}


build() {
    msg2 'Building binary'
    rm -f "$srcdir/bin/$_pkg"
    GOPATH="$srcdir" go install "$_gopkg"
}


package() {
    msg2 'Installing files'
    install -Dm644 -t "$pkgdir/usr/doc/$_pkg"           "$srcdir/src/$_gopkg/"{LICENSE,README.md}
    install -Dm644 -t "$pkgdir/usr/share/$_pkg/sources" "$srcdir/src/$_gopkg/sources/"*
    install -Dm644 -t "$pkgdir/usr/share/$_pkg/themes"  "$srcdir/src/$_gopkg/themes/"*
    install -Dm755 -t "$pkgdir/usr/bin"                 "$srcdir/bin/$_pkg"
}
