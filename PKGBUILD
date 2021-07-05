# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=syg_go
pkgver=0.2.0
pkgrel=1
pkgdesc='Yggdrasil address miner written in Go'

url="https://git.tdem.in/tdemin/syg_go"
arch=(any)
license=(LGPL3)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://git.tdem.in/tdemin/syg_go/archive/v${pkgver}.tar.gz")
sha256sums=('79825ce498ea29b34a10c644115c0205825adbf5b1f4c5d5413c74277e6d5278')

build () {
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="${SRCDEST}/go-modules"

    cd "${srcdir}/${pkgname}"
    go build -ldflags="-linkmode=external -X main.version=v$pkgver" .
}

check () {
    cd "${srcdir}/${pkgname}"
    go test ./...
}

package () {
    install -p -m 755 -D -t "$pkgdir/usr/bin/" "${srcdir}/${pkgname}/${pkgname}"
    install -m 644 -D -t "$pkgdir/usr/share/doc/$pkgname/" "${srcdir}/${pkgname}/README.md"
}
