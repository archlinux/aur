# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=polkit-explorer-git
_pkgname=${pkgname%-git}
pkgver=22.3ad139b
pkgrel=5
pkgdesc='Present PolicyKit information in a human-readable form.'
arch=('any')
url="https://github.com/scarygliders/${_pkgname}"
license=('ISC')
depends=('pyside6' 'python-lxml')
makedepends=('git')
conflicts=('polkit-explorer')
provides=('polkit-explorer')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d -m755 "${pkgdir}"/{usr/bin,opt/$_pkgname}
	install -m644 Ui_*.py "${pkgdir}/opt/${_pkgname}/"

	install -m755 'polkitex.py' "${pkgdir}/opt/${_pkgname}/"
	ln -s "/opt/${_pkgname}/polkitex.py" "${pkgdir}/usr/bin/polkitex"

	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "polkitex.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
