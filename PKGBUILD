# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.10.8
pkgrel=1
pkgdesc="A CLI application for interacting with a Cloudflare account"
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v0.10.8/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/cloudflare/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('153f1e6b803d969416cd872cbc6e3cd665e4b0a889ab524f7997290b50f986a0')

build() {
	cd ${_pkgname}-${pkgver}/cmd/${pkgname}
	go build \
		-trimpath \
		-ldflags "-extldflags $LDFLAGS"
}

package() {
	install -Dm755 ${_pkgname}-${pkgver}/cmd/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
