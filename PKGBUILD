#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

pkgver=1.8.0
pkgrel=1

pkgdesc="C bindings for the Go Cwtch library"
conflicts=('libcwtch-go-git')
depends=('tor')
makedepends=('go')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("$_pkgname-v$pkgver.tar.gz::https://git.openprivacy.ca/cwtch.im/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('7752c0bb5f9f7bf2c2d2fd9aa6d3fed1fd8b8e4f2207da86afd2271976b967fc41e6f12418982c14fe4fc43c99ed10c058ea98e66e6b1939e7241a8e66b1cdee')

prepare() {
    cd "$srcdir/$_pkgname"
    make clean
}

build() {
    cd "$srcdir/$_pkgname"

    export GOPATH="$srcdir/go"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath"

    make linux
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0644 libCwtch.so -t "$pkgdir/usr/lib/"
}
