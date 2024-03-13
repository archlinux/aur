# Maintainer: iamawacko <iamawacko@prptonmail.com>
# Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

pkgver=1.10.5
pkgrel=1

pkgdesc="C bindings for the Go Cwtch library"
conflicts=('libcwtch-go-git')
depends=('tor')
makedepends=('go')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("$_pkgname-v$pkgver.tar.gz::https://git.openprivacy.ca/api/v1/repos/cwtch.im/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('93180621d160c8c7ca3e6e59083668e59fddc8c462ed94a977358dfd77cb6feae7df8ec133eb494a36332ef83fd92710449451116178ae019c76df03e60bcdc9')

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
