# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=steam-removable-media-git
_gitdir=steam-removable-media
pkgver=22.12.r22.b62fe42
pkgrel=1
pkgdesc="Automounts and imports removable media as a Steam library"
arch=('any')
url="https://github.com/ShadowBlip/steam-removable-media"
license=('GPL')
groups=()
depends=('parted')
optdepends=()
makedepends=('git')
conflicts=('jupiter-hw-support')
_tag=b62fe42c7c96bc428b52467a776ebb22e81b1af4
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/usr/bin/shadowblip	
	mkdir -p ${pkgdir}/usr/bin/steamos-polkit-helpers	
	mkdir -p ${pkgdir}/usr/lib/media-support
	mkdir -p ${pkgdir}/usr/lib/hwsupport
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -m 755 usr/bin/shadowblip/* ${pkgdir}/usr/bin/shadowblip/
	install -m 755 usr/bin/steamos-polkit-helpers/* ${pkgdir}/usr/bin/steamos-polkit-helpers/
	install -m 744 usr/lib/media-support/* ${pkgdir}/usr/lib/media-support/
	install -m 744 usr/lib/hwsupport/* ${pkgdir}/usr/lib/hwsupport/
	install -m 644 "usr/lib/systemd/system/media-mount@.service" "${pkgdir}/usr/lib/systemd/system/media-mount@.service"
	install -m 644 usr/lib/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d/
	install -m 644 /usr/share/polkit-1/actions/* ${pkgdir}/usr/share/polkit-1/actions/
}
