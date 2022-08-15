# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=handygccs-git
_gitdir=HandyGCCS
pkgver=22.08.r78.b0b37c9
pkgrel=1
pkgdesc="Handheld Game Console Controller Support."
arch=('any')
url="https://github.com/ShadowBlip/HandyGCCS"
license=('GPL')
groups=()
depends=('python' 'python-evdev' 'dbus-python')
optdepends=()
makedepends=('git')
_tag=b0b37c90ab139669f77a15238186bc3541509c85
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

	install -m744 handycon.py ${pkgdir}/usr/local/bin/handycon.py
	install -m644 handycon.service ${pkgdir}/etc/systemd/system/handycon.service
	install -m644 60-handycon.rules ${pkgdir}/etc/udev/rules.d/60-handycon.rules
	install -m644 HandyGCCS-Controller.cfg ${pkgdir}/usr/share/libretro/autoconfig/udev/HandyGCCS-Controller.cfg
}
