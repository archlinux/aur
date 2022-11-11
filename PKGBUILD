# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=handygccs-git
_gitdir=HandyGCCS
pkgver=22.11.r107.d753ca8
pkgrel=1
pkgdesc="Handheld Game Console Controller Support."
arch=('any')
url="https://github.com/ShadowBlip/HandyGCCS"
license=('GPL')
groups=()
depends=('python' 'python-evdev' 'dbus-python' 'python-bmi160-i2c')
optdepends=()
makedepends=('git')
_tag=d753ca85f22b48ecbc217491702dc071c3fcfd08
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/etc/systemd/system
	mkdir -p ${pkgdir}/etc/udev/rules.d
	mkdir -p ${pkgdir}/usr/local/bin
	mkdir -p ${pkgdir}/usr/share/libretro/autoconfig/udev

	install -m744 constants.py ${pkgdir}/usr/local/bin/handycon.py
	install -m744 handycon.py ${pkgdir}/usr/local/bin/handycon.py
	install -m644 handycon.service ${pkgdir}/etc/systemd/system/handycon.service
	install -m644 60-handycon.rules ${pkgdir}/etc/udev/rules.d/60-handycon.rules
	install -m644 HandyGCCS-Controller.cfg ${pkgdir}/usr/share/libretro/autoconfig/udev/HandyGCCS-Controller.cfg
}
