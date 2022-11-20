# Maintainer: Brodi <me@brodi.space>
_pkgname=activity-relay
pkgname=${_pkgname}
pkgver=1.1.2
pkgrel=1
pkgdesc="Yet another powerful customizable ActivityPub relay server written in Go."
url="https://github.com/yukimochi/Activity-Relay"
arch=("any")
license=("AGPL3")
depends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/yukimochi/Activity-Relay/master/LICENCE")
sha512sums=("c9a6f6cd0c7cb052856f5612b4eb60cc8ae06f7f45e8b2e3594c41d3a442b30fb81a87a5b65c904dbd9a5879c6946e5d59d1a467affc05a66144faf0c3364acc"
"6e90d46be391aa645bcf4dfaa67f452cb15a73749f1895633789c7763b43cc0b65d391e5e95652c9a9a2063c956e0e8099a4e1ce4b70b0636629f9eac39c1080")

build() {
	cd "Activity-Relay-${pkgver}"
	go build
}

package() {
	install -d "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"
	pwd
	cd "Activity-Relay-${pkgver}"
	pwd
	install -Dm755 Activity-Relay "${pkgdir}/usr/bin/activity-relay"
	install -Dm755 config.yml.example "${pkgdir}/usr/share/doc/${_pkgname}/examples/config.yml.example"
}
