# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=rz608-fix-git
_gitdir=rz608-fix
pkgver=22.07.r3.0a9df20
pkgrel=1
pkgdesc="Allows use of the RZ608/MT7921K WiFi module."
arch=('any')
url="https://github.com/ShadowBlip/rz608-fix"
license=('GPL')
groups=()
depends=()
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
	mkdir -p ${pkgdir}/etc/udev/rules.d	
	mkdir -p ${pkgdir}/etc/modprobe.d
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/usr/lib/systemd/system-sleep
	mkdir -p ${pkgdir}/usr/lib/systemd/system-shutdown
	install -m 644 99-rz608.rules ${pkgdir}/etc/udev/rules.d/99-rz608.rules
	install -m 644 rz608.conf ${pkgdir}/etc/modprobe.d/rz608.conf
	install -m644 systemd-suspend-mods.conf ${pkgdir}/etc/systemd-suspend-mods.conf
	install -m744 systemd-suspend-mods.sh ${pkgdir}/usr/lib/systemd/system-sleep/systemd-suspend-mods.sh
	install -m744 mt7921e.shutdown ${pkgdir}/usr/lib/systemd/system-shutdown/mt7921e.shutdown
}
