# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=steam-removable-media-git
_gitdir=steam-removable-media
pkgver=23.03.r27.666d588
pkgrel=1
pkgdesc="Automounts and imports removable media as a Steam library"
arch=('any')
url="https://github.com/ShadowBlip/steam-removable-media"
license=('GPL')
groups=()
depends=('parted' 'f3')
optdepends=()
provides=('steam-removable-media')
makedepends=('git')
conflicts=('jupiter-hw-support')
_tag=666d58860991a8af47c984f92cb738ae14b28b1c
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"

	mkdir -p ${pkgdir}/usr/bin/shadowblip	
	install -m 755 usr/bin/shadowblip/* ${pkgdir}/usr/bin/shadowblip/

	mkdir -p ${pkgdir}/usr/bin/steamos-polkit-helpers	
	install -m 755 usr/bin/steamos-polkit-helpers/* ${pkgdir}/usr/bin/steamos-polkit-helpers/

	mkdir -p ${pkgdir}/usr/lib/media-support
	install -m 744 usr/lib/media-support/* ${pkgdir}/usr/lib/media-support/

	mkdir -p ${pkgdir}/usr/lib/hwsupport
	install -m 744 usr/lib/hwsupport/* ${pkgdir}/usr/lib/hwsupport/

	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m 644 "usr/lib/systemd/system/media-mount@.service" "${pkgdir}/usr/lib/systemd/system/media-mount@.service"

	mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
	install -m 644 usr/lib/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d/

	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -m 644 usr/share/polkit-1/actions/* ${pkgdir}/usr/share/polkit-1/actions/

	mkdir -p ${pkgdir}/usr/share/polkit-1/rules.d
	install -m 644 usr/share/polkit-1/rules.d/* ${pkgdir}/usr/share/polkit-1/rules.d/
}
