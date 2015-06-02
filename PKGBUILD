# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Augusto F. Hack <hack.augusto@gmail.com>

pkgname=diamond
pkgver=4.0
pkgrel=1
pkgdesc="Diamond is daemon that collects system metrics and publishes them to graphite and others"
arch=(any)
url="https://github.com/python-diamond/Diamond"
license=('mit')
depends=('python2' 'python2-configobj')
makedepends=('unzip')
optdepends=('python2-psycopg2: Collect data from postgresql database')
backup=(etc/diamond/diamond.conf)
source=("https://github.com/python-diamond/Diamond/archive/v${pkgver}.zip"
        'diamond.service')
md5sums=('87f4e5c1340ce085b3994360da0f8c4d'
         '65b275caf75c19e5040d3dbcd2a7e688')

package() {
	cd "$srcdir/Diamond-${pkgver}"

	install -D -m644 "$srcdir/diamond.service" "$pkgdir/usr/lib/systemd/system/diamond.service"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	rm "$pkgdir/etc/diamond/diamond.conf.example.windows"
	mv "$pkgdir/etc/diamond/diamond.conf.example" "$pkgdir/etc/diamond/diamond.conf"

	mkdir -p "$pkgdir/var/log/diamond" "$pkgdir/etc/diamond/collectors"
}
