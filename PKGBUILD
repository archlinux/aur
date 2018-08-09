# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=image-tools
pkgdesc='Tools to manipulate system images in OCI format'
pkgver=1.0.0_rc1
pkgrel=1
arch=(x86_64)
depends=(glibc)
makedepends=(go go-md2man make)
url='https://github.com/opencontainers/image-tools'
license=(custom:Apache-2.0)
source=("${url}/archive/v${pkgver//_/-}.tar.gz")
sha512sums=('d8c5e5943f0ad05f1a23d61a3a1894de6e41b57caab7cd9aca4eb9414476a4ae03291863dfee69d2042ca8bb5062d2f69662eeb37821254d9632d7e1dff1293a')
	
_gorepo=${url#https://}

prepare () {
	mkdir -p "_go/src/${_gorepo%${pkgname}}"
	ln -fs "$(pwd)/${pkgname}-${pkgver//_/-}" "_go/src/${_gorepo}"
}

build () {
	export GOPATH="$(pwd)/_go"
	cd "_go/src/${_gorepo}"
	make
}

package () {
	export GOPATH="$(pwd)/_go"
	cd "_go/src/${_gorepo}"
	DESTDIR="${pkgdir}" make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
