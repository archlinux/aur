# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vault2env
pkgver=2.1.0
pkgrel=1
pkgdesc="Small utility to transfer fields of a key in Vault into the environment"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ace06111181bdd75053f1beb2ac0c2839efbe5d55fb65ffaa3619bedd9bacee16312d11e17fefb89ae393d5ec7d52a054f5316724d8564878ceffec46bef2701')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on GOPATH="${srcdir}/go" go install \
		-a -v \
		-ldflags="-X main.version=${pkgver}" \
		-mod=readonly
}

package() {
	install -Dm755 "${srcdir}/go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
