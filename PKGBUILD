# Maintainer: Brodi <me@brodi.space>
_pkgname=activity-relay
pkgname=${_pkgname}
pkgver=0.2.9
pkgrel=1
pkgdesc="Yet another powerful customizable ActivityPub relay server written in Go."
url="https://github.com/yukimochi/Activity-Relay"
arch=('any')
license=(AGPL3)
depends=(go)
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/yukimochi/Activity-Relay/master/LICENCE")
sha512sums=('9cbdb3c9bbee3dc65b4e85c62f6ee850a541c610558b5a65e565b75d9c90cf7200b00833aca6dff7cad16c9a3b65c8fd50afdaa77f91a0df5ccbfdab59388087'
'6e90d46be391aa645bcf4dfaa67f452cb15a73749f1895633789c7763b43cc0b65d391e5e95652c9a9a2063c956e0e8099a4e1ce4b70b0636629f9eac39c1080')

build() {
	cd "Activity-Relay-${pkgver}"
	go build
}

package() {
	install -d "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"
	
	cd "Activity-Relay-${pkgver}"
	install -Dm755 Activity-Relay "${pkgdir}/usr/bin/activity-relay"
	install -Dm755 config.yaml.example "${pkgdir}/usr/share/doc/${_pkgname}/examples/config.yaml.example"
}
