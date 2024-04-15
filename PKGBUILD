# Maintainer: Bao Trinh <qubidt at gmail dot com>

_pkgname=madeline
pkgname=hare-${_pkgname}
pkgver=0.1.r29.g54dcf14
_commit='54dcf14b67f34da392be837d01889e2956905d68'
pkgrel=1
pkgdesc='tiny readline-alike with some batteries included'
arch=('any')
url='https://git.sr.ht/~ecs/madeline'
license=('custom:WTFPL')
depends=('hare')
makedepends=('git')
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('ebd1698d60a88948521163aa12e7a558672356e58741d72ee446f94e0cb57b87')

pkgver() {
	cd "${pkgname}"
	# shellcheck disable=2312
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "${pkgname}"
	hare test
}

package() {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/src/hare/third-party"
	cp -avt "${pkgdir}/usr/src/hare/third-party" "graph" "made"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "example.ha"
}
