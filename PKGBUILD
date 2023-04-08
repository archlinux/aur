# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Mateusz Galazyn <carbolymer@gmail.com>

pkgname=python-influxdb
pkgver=5.3.0
pkgrel=5
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdata/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests' 'python-dateutil' 'python-six' 'python-pytz' 'python-msgpack')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock' 'python-pandas' 'influxdb')
optdepends=('influxdb')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb-python/archive/v$pkgver.tar.gz)
sha512sums=('87129544b5bef8062d452447626b639b675bf6ba5076f38d4616a364fa6dfea6aa73beece239aeb8f2294314c4fe6bc7e3ae5d7e463592bd0f77ed3aaaff5557')

build() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py build
}


check() {
  cd "$srcdir/influxdb-python-$pkgver/influxdb"
  # TODO: fix one failing test
  # https://github.com/influxdata/influxdb-python/issues/844
#INFLUXDB_PYTHON_INFLUXD_PATH=/usr/bin/influxd nosetests -e test_write_points_from_dataframe_with_numeric_precision tests
}

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


# vim:set ts=2 sw=2 et:
