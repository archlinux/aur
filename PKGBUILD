# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=syg_go
pkgver=0.1.4
pkgrel=2
pkgdesc='Yggdrasil address miner written in Go'

url="https://git.tdem.in/tdemin/syg_go"
arch=(any)
license=(LGPL3)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://git.tdem.in/tdemin/syg_go/archive/v${pkgver}.tar.gz")
sha256sums=('add74b3bb077fbc6e5334a3c121f2eeec6fdf28af51615bdbd3718dcd579fc24')

build () {
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOPATH="${SRCDEST}/go-modules"

    cd "${srcdir}/${pkgname}"
    go build .
}

check () {
    cd "${srcdir}/${pkgname}"
    go test ./...
}

package () {
    install -p -m 755 -D -t "$pkgdir/usr/bin/" "${srcdir}/${pkgname}/${pkgname}"
    install -m 644 -D -t "$pkgdir/usr/share/doc/$pkgname/" "${srcdir}/${pkgname}/README.md"
}
