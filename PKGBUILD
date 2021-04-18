# Maintainer: Roshless <pkgs@roshless.com>

pkgname='netbox'
pkgver=2.11.0
pkgrel=2
pkgdesc='IP address management (IPAM) and data center infrastructure management (DCIM) tool.'
arch=('any')
url='https://github.com/digitalocean/netbox'
license=('Apache-2.0')
depends=(
  'python'
  'gunicorn'
  'python-django'
	'python-django-cacheops'
	'python-django-cors-headers'
	'python-django-debug-toolbar'
	'python-django-filter'
	'python-django-mptt'
	'python-django-pglocks'
	'python-django-prometheus'
	'python-django-rq'
	'python-django-tables2'
	'python-django-taggit'
	'python-django-timezone-field'
	'python-django-rest-framework'
	'python-drf-yasg'
	'python-jinja'
	'python-markdown'
	'python-netaddr'
	'python-pillow'
	'python-psycopg2'
	'python-pycryptodome'
	'python-pyaml'
	'python-redis'
	'python-svgwrite'
)

conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("https://github.com/digitalocean/netbox/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname-rq.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfile"
        "upgrade.sh")
backup=('etc/netbox/configuration.py')

package() {
	#install -dm775 "$pkgdir/etc/$pkgname"
	install -d "$pkgdir/var/lib/"$pkgname
	cp -r $pkgname-$pkgver/$pkgname/. "$pkgdir/var/lib/$pkgname"

	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 $pkgname-rq.service "$pkgdir/usr/lib/systemd/system/$pkgname-rq.service"
	install -Dm644 $pkgname.tmpfile "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -d "$pkgdir/etc/$pkgname"
	install -D -m644 $pkgname-$pkgver/$pkgname/$pkgname/configuration.example.py "$pkgdir/etc/netbox/configuration.py"
	install -D -m755 upgrade.sh "$pkgdir/etc/netbox/upgrade.sh"
	ln -s "/etc/netbox/configuration.py" "$pkgdir/var/lib/netbox/netbox/configuration.py"
}

md5sums=('ef794d344ab5a3b2d9c854867580d0cf'
         '55dcba60ed4cb66b350d3d8f2946aef9'
         'ad07c0c741a231b8d8012221bee2c167'
         'b653f7da646e78ad5c69d3960bbafd9c'
         '17532f81746d5378abbf9721c526247b'
         '97c618de19719135aa84458789b025b1')
