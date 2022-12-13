# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=handygccs-git
_gitdir=HandyGCCS
pkgver=22.12.r117.372c5a0
pkgrel=1
pkgdesc="Handheld Game Console Controller Support."
arch=('any')
url="https://github.com/ShadowBlip/HandyGCCS"
license=('GPL')
groups=()
depends=('python' 'python-evdev' 'dbus-python' 'python-bmi160-i2c')
optdepends=()
makedepends=('git')
_tag=372c5a007fd5f132bec36b4b302d05d45524e39c
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/etc/modules-load.d
	mkdir -p ${pkgdir}/etc/udev/rules.d
	mkdir -p ${pkgdir}/usr/local/bin
	mkdir -p ${pkgdir}/usr/share/libretro/autoconfig/udev

	install -m744 constants.py ${pkgdir}/usr/local/bin/constants.py
	install -m644 handycon.conf ${pkgdir}/etc/modules-load.d/handycon.conf
	install -m744 handycon.py ${pkgdir}/usr/local/bin/handycon.py
	install -m644 handycon.service ${pkgdir}/etc/systemd/system/handycon.service
	install -m644 60-handycon.rules ${pkgdir}/etc/udev/rules.d/60-handycon.rules
	install -m644 HandyGCCS-Controller.cfg ${pkgdir}/usr/share/libretro/autoconfig/udev/HandyGCCS-Controller.cfg
}
