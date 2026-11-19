# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/xtouch-daemon/tree/main/packaging/aur/xtouch-daemon-gui-bin
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=xtouch-daemon-gui-bin
_pkgname=xtouch-daemon-gui
pkgver=0.2.0
pkgrel=1
pkgdesc="The GUI of xtouch-daemon: edit the configuration of the X-Touch Extender, with a live view of the device"
arch=('any')
url="https://github.com/markusressel/xtouch-daemon"
license=('AGPL-3.0-or-later')
# the GUI runs on the system's Python with its PyQt6, and uses the packages of xtouch-daemon-bin of the same version
depends=("xtouch-daemon-bin=${pkgver}" 'python>=3.14' 'python<3.15' 'python-pyqt6' 'qt6-base')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-any.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-any.tar.gz")
sha256sums=('aa652c28f482a2f95ea978a6ca6cee8958105c1fc13d71c51896d50f3216b167')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-any"
	# not -a: the files belong to root in the package, not to the user who built it
	cp -dr --preserve=mode,timestamps usr "${pkgdir}/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
