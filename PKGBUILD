#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

pkgver=1.5.4
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
sha512sums=('325639dbc7c7af0a63e9b699b3b6524d2bb4c4c72d5d1985e5d020df6ed35ec84fe0dad98502c297122b2e50e8cbebec29d045e96c056aeaecba32d8dd18305c')

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
