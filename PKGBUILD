# Maintainer: nous <nous@archlinux.us>
# Maintainer: artoo <artoo@manjaro.org>

_url="https://gitweb.gentoo.org/repo/gentoo.git/plain"

#pkgbase=openrc-base
pkgname=dbus-openrc
pkgver=20160923
pkgrel=1
pkgdesc="OpenRC dbus init script"
arch=('any')
url="https://github.com/OpenRC"
license=('GPL2')
groups=('openrc-base' 'openrc-desktop')
depends=('openrc' 'dbus-nosystemd')
conflicts=('dbus-openrc<=1.10.10-5')
#replaces=('dbus-openrc<=1.10.10-5')
source=("dbus.initd::${_url}/sys-apps/dbus/files/dbus.initd-r1")
sha256sums=('4491c09942d72fd464bc1da286c4f5a237ec8debfbaba83c6fbf4a46d46fe51e')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
            -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
            -e 's|/var/run|/run|g' \
            -i ${pkgdir}/etc/init.d/$1
}

package() {
    _inst_initd 'dbus'

    sed -e 's|dbus.pid|dbus/pid|g' -i "${pkgdir}/etc/init.d/dbus"
}
