#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

pkgver=1.4.2
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
sha512sums=('4a1b7374957043e987c3bf637a3f6a1c62c45629d14e526d160986e90440e8bf057220d7bd7cd7a1b529884a837a827fc647464ace62c63aa28cbb994bea96a8')

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
