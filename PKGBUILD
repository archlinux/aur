# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=hare-madeline
pkgver=r136.58698e5
pkgrel=1
pkgdesc='tiny readline-alike with some batteries included'
arch=('any')
url='https://git.d2evs.net/~ecs/madeline'
license=('custom:WTFPL')
depends=('hare')  # >=r2843
makedepends=('git')
_commit='58698e5ccf19a44d49315f76033165a5d903b8b3'
source=("${pkgname}::git+${url}#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}
