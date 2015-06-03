# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Augusto F. Hack <hack.augusto@gmail.com>

pkgname=diamond
pkgver=4.0.41
pkgrel=1
pkgdesc="Diamond is daemon that collects system metrics and publishes them to graphite and others"
arch=(any)
url="https://github.com/python-diamond/Diamond"
license=('mit')
depends=('python2' 'python2-configobj')
makedepends=('unzip')
optdepends=('python2-psycopg2: Collect data from postgresql database')
backup=(etc/diamond/diamond.conf)
source=("https://pypi.python.org/packages/source/d/diamond/diamond-${pkgver}.tar.gz"
        'diamond.service')
md5sums=('063ee62fc30a678260df582335a583c3'
         '65b275caf75c19e5040d3dbcd2a7e688')

package() {
	cd "$srcdir/diamond-${pkgver}"

	install -D -m644 "$srcdir/diamond.service" "$pkgdir/usr/lib/systemd/system/diamond.service"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	rm "$pkgdir/etc/diamond/diamond.conf.example.windows"
	mv "$pkgdir/etc/diamond/diamond.conf.example" "$pkgdir/etc/diamond/diamond.conf"

	mkdir -p "$pkgdir/var/log/diamond" "$pkgdir/etc/diamond/collectors"
}
