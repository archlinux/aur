# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=handygccs-git
_gitdir=HandyGCCS
pkgver=22.12.r118.5905193
pkgrel=1
pkgdesc="Handheld Game Console Controller Support."
arch=('any')
url="https://github.com/ShadowBlip/HandyGCCS"
license=('GPL')
groups=()
depends=('python' 'python-evdev' 'dbus-python' 'python-bmi160-i2c')
optdepends=()
makedepends=('git')
_tag=59051932c5166b0137fa9beeeb6c2fcf42f1702e
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/usr/lib/modules-load.d
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	mkdir -p ${pkgdir}/usr/share/handygccs/scripts
	mkdir -p ${pkgdir}/usr/share/libretro/autoconfig/udev

	install -m644 usr/lib/modules-load.d/handycon.conf ${pkgdir}/usr/lib/modules-load.d
	install -m644 usr/lib/systemd/system/handycon.service ${pkgdir}/usr/lib/systemd/system
	install -m644 usr/lib/udev/rules.d/60-handycon.rules ${pkgdir}/usr/lib/udev/rules.d
	install -m744 usr/share/handygccs/scripts/constants.py ${pkgdir}/usr/share/handygccs/scripts
	install -m744 usr/share/handygccs/scripts/handycon.py ${pkgdir}/usr/share/handygccs/scripts
	install -m644 usr/share/libretro/autoconfig/udev/HandyGCCS-Controller.cfg ${pkgdir}/usr/share/libretro/autoconfig/udev
}
