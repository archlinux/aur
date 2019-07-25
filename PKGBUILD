# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.9.4
pkgrel=1
pkgdesc="A CLI application for interacting with a Cloudflare account"
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v0.9.3/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('765f3f1970b895cc15de07ef1697bf1918b475cd065c304ad61bf2847f58d667')

build() {
  cd ${_pkgname}-${pkgver}/cmd/${pkgname}
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD"
}

package() {
  install -Dm755 ${_pkgname}-${pkgver}/cmd/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
