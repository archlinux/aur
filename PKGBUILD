# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=hpfall-openrc
pkgver=1.0
pkgrel=1
pkgdesc="Disk protection for HP machines."
arch=('i686' 'x86_64')
provides=('hpfall-openrc')
pkgname=('hpfall-openrc')
depends=('hpfall-git' 'openrc')
backup=('etc/conf.d/hpfall')
url="https://github.com/cromerc/hpfall-openrc"
license=("GPL2")
source=("https://github.com/cromerc/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7718990fe8f40ff6ae9228bd5d0ce8eb923eda986d361859740d419345a58e9d')

_inst_initd(){
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/init.d/$1 ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/config.d/$1 ${pkgdir}/etc/conf.d/$1
}

package_hpfall-openrc() {
	pkgdesc="Disk protection for HP machines."
	depends=('hpfall-git' 'openrc')
	backup=('etc/conf.d/hpfall')
	install=hpfall-openrc.install

	_inst_confd 'hpfall'
	_inst_initd 'hpfall'
}
