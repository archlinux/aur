_pkgname=hue-plus
pkgname=hue-plus-git
pkgver=r63.5a092af
pkgrel=1
pkgdesc="A Linux driver in Python for the NZXT Hue+"
arch=('any')
url="https://github.com/kusti8/hue-plus"
license=('GPL3')
depends=('python-pyserial')
optdepends=('zenity: gui support'
			'python-pyqt5: gui support'
)
makedepends=('git')
provides=('hue-plus')
source=('git+https://github.com/kusti8/hue-plus.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d "${pkgdir}/opt/${_pkgname}"
	install -Dm755 hue.py "${pkgdir}/opt/${_pkgname}/hue.py"
	install -Dm755 picker.py "${pkgdir}/opt/${_pkgname}/picker.py"
	install -Dm755 hue-ui.py "${pkgdir}/opt/${_pkgname}/hue-ui.py"
	install -Dm755 previous.py "${pkgdir}/opt/${_pkgname}/previous.py"
	install -Dm755 previous.p "${pkgdir}/var/lib/${_pkgname}/previous.p"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/hue.py" "${pkgdir}/usr/bin/hue"
	ln -s "/opt/${_pkgname}/picker.py" "${pkgdir}/usr/bin/hue-picker"
	ln -s "/opt/${_pkgname}/hue-ui.py" "${pkgdir}/usr/bin/hue-ui"
}
