# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.9.2
pkgrel=1
pkgdesc="A CLI application for interacting with a Cloudflare account"
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v0.9.2/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('73541c9667082950547f62d44907995aa82b51ec2da2e00756f2ac5e776a1372')

build() {
  cd ${_pkgname}-${pkgver}/cmd/${pkgname}
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD"
}

package() {
  install -Dm755 ${_pkgname}-${pkgver}/cmd/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
