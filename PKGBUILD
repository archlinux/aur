# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='gbt'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Go'
url="https://github.com/jtyr/gbt"
arch=('any')
license=('MIT')
makedepends=('go')
optdepends=('nerd-fonts-complete')
source=()
sha256sums=()

_gopkg="github.com/jtyr/$pkgname"


prepare() {
    msg2 'Fetching Go package'
    rm -fr "$srcdir/src/$_gopkg"
    GOPATH="$srcdir" go get -u "$_gopkg"
    cd "$srcdir/src/$_gopkg"
    git checkout "v$pkgver"
}


build() {
    msg2 'Building binary'
    rm -f "$srcdir/bin/$pkgname"
    GOPATH="$srcdir" go install "$_gopkg"
}


package() {
    msg2 'Installing files'
    install -Dm644 -t "$pkgdir/usr/doc/$pkgname"           "$srcdir/src/$_gopkg/"{LICENSE,README.md}
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/sources" "$srcdir/src/$_gopkg/sources/"*
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/themes"  "$srcdir/src/$_gopkg/themes/"*
    install -Dm755 -t "$pkgdir/usr/bin"                    "$srcdir/bin/$pkgname"
}
