# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=polkit-explorer
pkgver=12.065314e
pkgrel=2
pkgdesc='Present PolicyKit information in a human-readable form.'
arch=('any')
url="https://github.com/scarygliders/${pkgname}"
license=('ISC')
depends=('python2-pyqt5' 'python2-lxml')
source=("git://github.com/scarygliders/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"
	local pydir='usr/lib/python2.7/site-packages/polkitex'

	install -d -m755 "${pkgdir}"/{usr/bin,$pydir}
	install -m644 Ui_*.py "${pkgdir}/${pydir}/"

	install -m755 'polkitex.py' "${pkgdir}/${pydir}/"
	ln -s "/${pydir}/polkitex.py" "${pkgdir}/usr/bin/polkitex"
  
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "polkitex.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
