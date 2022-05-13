# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=aya-neo-fixes-git
_gitdir=aya-neo-fixes
pkgver=22.05.r44.c07ba24
pkgrel=1
pkgdesc="Various fixes for Aya Neo Handheld consoles."
arch=('any')
url="https://github.com/ShadowBlip/aya-neo-fixes"
license=('GPL')
groups=()
depends=('python' 'python-evdev')
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
	mkdir -p ${pkgdir}/etc/modprobe.d	
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/usr/lib/systemd/system-sleep
	mkdir -p ${pkgdir}/usr/lib/systemd/system-shutdown
	mkdir -p ${pkgdir}/usr/local/bin
	install -m644 systemd-suspend-mods.conf ${pkgdir}/etc/systemd-suspend-mods.conf
	install -m755 systemd-suspend-mods.sh ${pkgdir}/usr/lib/systemd/system-sleep/systemd-suspend-mods.sh
	install -m755 mt7921e.shutdown ${pkgdir}/usr/lib/systemd/system-shutdown/mt7921e.shutdown
	install -m755 neo-controller.py ${pkgdir}/usr/local/bin/neo-controller.py
	install -m755 neo-controller.service ${pkgdir}/etc/systemd/system/neo-controller.service
	install -m755 phantom-input.py ${pkgdir}/usr/local/bin/phantom-input.py
	install -m755 phantom-input.service ${pkgdir}/etc/systemd/system/phantom-input.service
}
