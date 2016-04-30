# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=freefall-openrc
pkgver=1.0
pkgrel=1
pkgdesc="Disk protection for HP/Dell machines."
arch=('any')
provides=('freefall-openrc')
pkgname=('freefall-openrc')
depends=('freefall' 'openrc')
replaces=('hpfall-openrc')
backup=('etc/conf.d/freefall')
url="https://github.com/cromerc/freefall-openrc"
license=("GPL2")
source=("freefall.initd" "freefall.confd")
sha256sums=('65dced0f1f866947143b05e6c8452e415eabe6c4293b0cac6ca78c4b4ab923c5'
            '3ed6f497dbb8f6b8a65f369b74d04a826a1b0463b344ce5d1b2000d97f4d5471')

_inst_initd(){
	install -Dm755 freefall.initd ${pkgdir}/etc/init.d/freefall

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 freefall.confd ${pkgdir}/etc/conf.d/freefall
}

package_freefall-openrc() {
	pkgdesc="Disk protection for HP/Dell machines."
	depends=('freefall' 'openrc')
	backup=('etc/conf.d/freefall')
	install=freefall-openrc.install

	_inst_confd 'freefall'
	_inst_initd 'freefall'
}
