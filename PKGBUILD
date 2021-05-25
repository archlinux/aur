# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=achannarasappa-ticker
pkgver=4.1.1
pkgrel=1
pkgdesc='terminal stock watcher and stock position tracker'
arch=('x86_64')
url='https://github.com/achannarasappa/ticker'
license=('GPL3')
makedepends=(
    'git'
    'go'
)
source=("ticker-$pkgver.tar.gz::https://github.com/achannarasappa/ticker/archive/v$pkgver.tar.gz")
sha512sums=('e50504f45c0516bb40f66313ec528bb1e17c817171ef44dc881a78376c7694f692d40aff5bfb5f67b2004561dce667fbefbbbbe0d768e83895acd3c0cac5cd76')

build() {
    cd "ticker-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ./ticker .
}

package() {
    cd "ticker-${pkgver}"
    install -Dm755 ticker "${pkgdir}"/usr/bin/ticker
}
