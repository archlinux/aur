# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.10.7
pkgrel=1
pkgdesc="A CLI application for interacting with a Cloudflare account"
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v0.10.7/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('6b35724857e8d7778c73ee4cd64ce98481576abefe6921fd4c09f2ead73f1dbe')

build() {
	cd ${_pkgname}-${pkgver}/cmd/${pkgname}
	go build \
		-trimpath=$PWD" \
		-ldflags "-extldflags $LDFLAGS"
}

package() {
  install -Dm755 ${_pkgname}-${pkgver}/cmd/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
