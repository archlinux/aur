# Maintainer: Anton Hvornum anton@hvornum.se
# Contributor: Anton Hvornum anton@hvornum.se
pkgname="archinstall-gui"
pkgver="0.1rc9"
pkgdesc="A graphical installer for Arch Linux. Useful for Live CD's etc."
pkgrel=1
url="https://github.com/Torxed/archinstall"
license=('GPLv3')
provides=("${pkgname}")
md5sums=('SKIP')
arch=('x86_64')
source=("${pkgname}-v${pkgver}-x86_64.tar.gz::https://github.com/Torxed/archinstall_gui/archive/v$pkgver.tar.gz")
depends=('python>=3.8' 'falkon' 'xorg-server' 'xorg-xinit')
optdepends=('python-systemd: Adds more controlled logging functionality')

package() {
	# Will add this back when I've renamed the project upstream:
	# cd "${pkgname}-${pkgver}"
	cd "archinstall_gui-${pkgver}"

	mkdir -p "${pkgdir}/srv/archinstall_gui"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc/systemd/system"

	mv archinstall_gui/* "${pkgdir}/srv/archinstall_gui/"
	mv PKGBUILD_DATA/archinstall-gui "${pkgdir}/usr/bin/archinstall-gui"
	mv PKGBUILD_DATA/archinstall_gui.service "${pkgdir}/etc/systemd/system/archinstall_gui.service"

	chmod +x "${pkgdir}/srv/archinstall_gui/webgui.py"
	chmod +x "${pkgdir}/usr/bin/archinstall-gui"
}
