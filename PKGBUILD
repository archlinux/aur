# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=syg_go
pkgver=0.1.3
pkgrel=2
pkgdesc='Yggdrasil address miner written in Go'

url="https://git.tdem.in/tdemin/syg_go"
arch=(any)
license=(LGPL3)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://git.tdem.in/tdemin/syg_go/archive/v${pkgver}.tar.gz")
md5sums=('d173e49abedffa33babff5d70c01afbd')
sha256sums=('67128efd548a635f0d8ab30c6dfda266cf4bfd31fe856150273944c9e460a859')

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
