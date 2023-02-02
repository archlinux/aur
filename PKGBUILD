# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=achannarasappa-ticker
pkgver=4.5.5
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
sha512sums=('1851fd9c49f01ea73886ddddf014d3598595f52655142c729fe6156fc4c2333e7f6295c084605a8599de41426148c809a938ea2ce8ef698444cdfd8c52de4566')

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
