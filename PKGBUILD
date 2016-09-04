# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=firewalld-openrc
pkgver=1.0
pkgrel=2
pkgdesc="OpenRC scripts for firewalld."
arch=('any')
provides=('firewalld-openrc')
pkgname=('firewalld-openrc')
depends=('firewalld' 'openrc')
url="https://github.com/cromerc/arch-openrc"
license=("GPL2")
source=("firewalld.init")
sha256sums=('96593cc0e8efcb60b0aa6b9e994dae31ec31cd812aca1145b7829b0a40e0dfa6')

_inst_initd(){
	install -Dm755 firewalld.init ${pkgdir}/etc/init.d/firewalld

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
        -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-e 's|/usr/sbin|/usr/bin|g' \
		-i ${pkgdir}/etc/init.d/$1
}

package_firewalld-openrc() {
	pkgdesc="OpenRC scripts for firewalld."
	depends=('firewalld' 'openrc')
	install=firewalld-openrc.install

	_inst_initd 'firewalld'
}
