# Maintainer: Bet4 <0xbet4@gmail.com>

pkgname=gitbatch
pkgver=0.6.1
pkgrel=1
pkgdesc="Manage your git repositories in one place"
arch=("x86_64")
url="https://github.com/isacikgoz/gitbatch"
license=("MIT")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0ef36a4ea0b6cf4beb51928dd51281ec106006ba800c439d2588515c1bfeaf41')


build() {
    cd "${pkgname}-${pkgver}"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ${pkgname} ./cmd/...
}

package(){
    cd "${pkgname}-${pkgver}"
    install -Dm755 ${pkgname} "$pkgdir"/usr/bin/$pkgname
}
