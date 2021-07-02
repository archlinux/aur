# Maintainer: Brodi <me@brodi.space>
_pkgname=activity-relay
pkgname=${_pkgname}
pkgver=1.0.0
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
sha512sums=('73483c7e90ff2699dc41e9ec8e4ac823b0afaa71e49dafb01e2723e78bdb296801e206490d1450ed0743dfe24c5927d005141d7e688f09d6429d99b891e98b23'
'6e90d46be391aa645bcf4dfaa67f452cb15a73749f1895633789c7763b43cc0b65d391e5e95652c9a9a2063c956e0e8099a4e1ce4b70b0636629f9eac39c1080')

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
