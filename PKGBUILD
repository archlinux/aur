# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_name=netbox
pkgname=${_name}
pkgver=1.6.3
pkgrel=3
pkgdesc="IP address management (IPAM) and data center infrastructure management (DCIM) tool."
arch=('any')
url="https://github.com/digitalocean/${_name}"
license=('Apache-2.0')
depends=('python2'
         'graphviz'
         'gunicorn-python2'
         'libffi'
         'libpgf'
         'openssl'
         'python2-crypto'
         'python2-cryptography'
         'python2-django'
         'python2-django-debug-toolbar-git'
         'python2-django-filter'
         'python2-django-rest-framework'
         'python2-django-tables2'
         'python2-lxml'
         'python2-markdown'
         'python2-natsort'
         'python2-ncclient'
         'python2-netaddr'
         'python-paramiko'
         'python2-py-gfm'
         'python2-sqlparse'
         'python2-xmltodict')

conflicts=("${_name}-git")
replaces=("${_name}-git")
install="${_name}.install"
source=("${url}/archive/v${pkgver}.tar.gz"
        "${_name}-system.service"
        "${_name}.tmpfile"
				"gunicorn_config.py")
sha256sums=('426a7b31e15acaaa9286b423a26f6d6e262f6b94e9060c5acabee2e9c5685dd4'
            '5aaf2eef73c77c64bd78a50a80b8f4b3af87b63c64b139d63aa4a95cd82b1ca4'
            'b8f7030f570e7707eb9c0f41c382e37d54244e7885c795a9f31788efdd45914e'
            '7a5ae05cad7ec14193a43ef080776b5525c80b6258762a6cb6a108db83861ff9')
backup=('etc/netbox/gunicorn_config.py')

package() {
	mkdir -p "${pkgdir}/opt/${_name}"
	chmod 775 "${pkgdir}/opt/${_name}"
	cp -r ${_name}-${pkgver}/* "$pkgdir/opt/${_name}"

	install -D -m644 ${_name}-system.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
	install -D -m644 ${_name}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"

	mkdir -p "$pkgdir/etc/netbox"
	install -D -m644 gunicorn_config.py "$pkgdir/etc/netbox/gunicorn_config.py"

	find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim: set ts=2 sw=2 ft=sh noet:
