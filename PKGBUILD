# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=syg_go
pkgver=0.1.4
pkgrel=1
pkgdesc='Yggdrasil address miner written in Go'

url="https://git.tdem.in/tdemin/syg_go"
arch=(any)
license=(LGPL3)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://git.tdem.in/tdemin/syg_go/archive/v${pkgver}.tar.gz")
md5sums=('6eccbae1ebdff3ae717f858600b3e3c5')
sha256sums=('8df40ee3fbdb57827277c4f7d11e4c10e77f246f926dfff44b325a95329992b0')

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
