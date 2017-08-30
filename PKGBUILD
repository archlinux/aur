# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_name=netbox
pkgname=${_name}
pkgver=2.1.4
_realver="${pkgver}"
pkgrel=1
pkgdesc="IP address management (IPAM) and data center infrastructure management (DCIM) tool."
arch=('any')
url="https://github.com/digitalocean/${_name}"
license=('Apache-2.0')
depends=('python'
         'gunicorn'
         'libffi'
         'libpgf'
         'openssl'
				 'python-coreapi'
         'python-crypto'
         'python-cryptography'
         'python-django'
         'python-django-cors-headers'
         'python-django-debug-toolbar'
         'python-django-filter'
         'python-django-mptt'
         'python-django-rest-framework'
         'python-django-rest-swagger'
         'python-django-tables2'
         'python-graphviz'
         'python-lxml'
         'python-markdown'
         'python-natsort'
         'python-ncclient'
         'python-netaddr'
				 'python-openapi-codec'
         'python-paramiko'
				 'python-pillow'
         'python-py-gfm'
         'python-pytz'
         'python-psycopg2'
				 'python-simplejson'
         'python-sqlparse'
         'python-xmltodict'
				 'python-yaml')

conflicts=("${_name}-git")
replaces=("${_name}-git")
install="${_name}.install"
source=("${url}/archive/v${_realver}.tar.gz"
        "${_name}-system.service"
        "${_name}.tmpfile"
				"gunicorn_config.py")
sha256sums=('425d4ea16babf47bb021f984daa404692516fc22e78b13ca2088743e1e2e3b00'
            'dc83de37ff9151de3d309fd43c6eff3b30886882012b81fd3ff2f3a5a706bea6'
            '1028bac96ddcd18c10646dff26027b4891fcab4381436e2b6ea3302887a5586f'
            '7a5ae05cad7ec14193a43ef080776b5525c80b6258762a6cb6a108db83861ff9')
backup=('etc/netbox/gunicorn_config.py' 'etc/netbox/configuration.py')

package() {
	mkdir -p "${pkgdir}/opt/${_name}"
	chmod 775 "${pkgdir}/opt/${_name}"
	cp -r ${_name}-${_realver}/${_name} "$pkgdir/opt/"

	install -D -m644 ${_name}-system.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
	install -D -m644 ${_name}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"

	mkdir -p "$pkgdir/etc/netbox"
	install -D -m644 gunicorn_config.py "$pkgdir/etc/netbox/gunicorn_config.py"
	install -D -m644 ${_name}-${_realver}/${_name}/${_name}/configuration.example.py "$pkgdir/etc/netbox/configuration.py"
	ln -s /etc/netbox/configuration.py "$pkgdir/opt/netbox/netbox/configuration.py"
}

# vim: set ts=2 sw=2 ft=sh noet:
