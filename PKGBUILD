# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=aya-neo-fixes-git
_gitdir=aya-neo-fixes
pkgver=22.06.r57.0b3b6f3
pkgrel=1
pkgdesc="Various fixes for Aya Neo Handheld consoles."
arch=('any')
url="https://github.com/ShadowBlip/aya-neo-fixes"
license=('GPL')
groups=()
depends=('python' 'python-evdev' 'dbus-python')
optdepends=()
makedepends=('git')
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/etc
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/etc/udev/rules.d
	mkdir -p ${pkgdir}/usr/lib/systemd/system-sleep
	mkdir -p ${pkgdir}/usr/lib/systemd/system-shutdown
	mkdir -p ${pkgdir}/usr/local/bin
	install -m644 systemd-suspend-mods.conf ${pkgdir}/etc/systemd-suspend-mods.conf
	install -m744 systemd-suspend-mods.sh ${pkgdir}/usr/lib/systemd/system-sleep/systemd-suspend-mods.sh
	install -m744 mt7921e.shutdown ${pkgdir}/usr/lib/systemd/system-shutdown/mt7921e.shutdown
	install -m744 neo-controller.py ${pkgdir}/usr/local/bin/neo-controller.py
	install -m644 neo-controller.service ${pkgdir}/etc/systemd/system/neo-controller.service
	install -m644 60-neo-controller.rules ${pkgdir}/etc/udev/rules.d/60-neo-controller.rules
}
