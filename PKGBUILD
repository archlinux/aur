# Maintainer: Jan Vanmullem <jan@siteworld.be>

_pkgname=alpaca
pkgname="${_pkgname}-proxy"
pkgver=1.3.2
pkgrel=1
pkgdesc="Alpaca is a local HTTP proxy for command-line tools."
license=('apache')
arch=('x86_64')
makedepends=('go')
url="https://github.com/samuong/${_pkgname}"
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p build
}

build() {	
	cd "${_pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build .
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -D -m 0755 "build/${_pkgname}" "${pkgdir}/usr/bin/$_pkgname"
}

sha512sums=('327012d9a61c6acdfc0037cce15f389c3061bf4e0d132284ff6ce7746e5a91dc1797e131d8f2fd5b3e6c1ec7079fb17f340bd0dbf45c0be962b9b2424cae55a7')
