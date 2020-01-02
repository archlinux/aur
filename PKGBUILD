# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=task-indicator-git
pkgdesc='Panel indicator for TaskWarrior'
pkgver=r163.7322dd8
pkgrel=1
url=https://github.com/umonkey/task-indicator
license=(custom:MIT)
arch=(any)
depends=(python2 hicolor-icon-theme python2-gobject2)
optdepends=('libappindicator-gtk2: Application indicator support')
conflicts=(task-indicator taskwarrior-indicator-hg)
provides=("${conflicts[@]}")
replaces=(taskwarrior-indicator-hg)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	python2 setup.py install --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
