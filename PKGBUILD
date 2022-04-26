#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

pkgver=1.7.1
pkgrel=1

pkgdesc="C bindings for the Go Cwtch library"
conflicts=('libcwtch-go-git')
depends=('tor')
makedepends=('go')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("$_pkgname-v$pkgver.tar.gz::https://git.openprivacy.ca/cwtch.im/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('a7471d043af3af933969cf6d5745a8371842860e98af54510134c382769d0110397778d330548258adabb230a3810c7e7988938b77d3a8c8bd574cca60703ffe')

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
