# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=polkit-explorer-git
pkgver=15.fac8d70
pkgrel=2
pkgdesc='Present PolicyKit information in a human-readable form.'
arch=('any')
url="https://github.com/scarygliders/${pkgname//-git}"
license=('ISC')
depends=('python-pyqt5' 'python-lxml')
conflicts=('polkit-explorer')
provides=('polkit-explorer')
source=("git://github.com/scarygliders/${pkgname//-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d -m755 "${pkgdir}"/{usr/bin,opt/$pkgname}
	install -m644 Ui_*.py "${pkgdir}/opt/${pkgname}/"

	install -m755 'polkitex.py' "${pkgdir}/opt/${pkgname}/"
	ln -s "/opt/${pkgname}/polkitex.py" "${pkgdir}/usr/bin/polkitex"

	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "polkitex.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
