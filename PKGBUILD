# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=teamviewer-openrc
pkgver=1.0
pkgrel=2
pkgdesc="OpenRC scripts for teamviewer."
arch=('any')
provides=('teamviewer-openrc')
pkgname=('teamviewer-openrc')
depends=('teamviewer' 'openrc')
backup=('etc/conf.d/teamviewer')
url="https://github.com/cromerc/arch-openrc"
license=("GPL2")
source=("teamviewer.init" "teamviewer.conf")
sha256sums=('dd1fa7d8d1513ce5a908dfa514cbe59ccf0d840714de14ce8297dfb49f752e3f'
            '5cd8485974ef1c62be8fbe4d92f31a03b616e1a3e46c11bcadef7bdb2c169d8a')

_inst_initd(){
	install -Dm755 teamviewer.init ${pkgdir}/etc/init.d/teamviewer

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
        -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-e 's|/usr/sbin|/usr/bin|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 teamviewer.conf ${pkgdir}/etc/conf.d/teamviewer
}

package_teamviewer-openrc() {
	pkgdesc="OpenRC scripts for teamviewer."
	depends=('teamviewer' 'openrc')
	backup=('etc/conf.d/teamviewer')
	install=teamviewer-openrc.install

	_inst_confd 'teamviewer'
	_inst_initd 'teamviewer'
}
