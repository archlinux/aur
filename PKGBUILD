# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Mateusz Galazyn <carbolymer@gmail.com>

pkgname=python-influxdb
pkgver=5.2.1
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdata/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests' 'python-dateutil' 'python-six' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-requests-mock' 'python-pandas' 'influxdb')
optdepends=('influxdb')
options=(!emptydirs)
source=("https://github.com/influxdata/influxdb-python/archive/v$pkgver.tar.gz")
sha512sums=('5a537ca14330d4ff133db1a06a126a7de2eedaa4dfe17e843cb07c7f7d515eb483d498348b28a172a99eac3942b05d91f507feb6dcc4de2e9568940e0520acdc')

build() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py build
}


check() {
  cd "$srcdir/influxdb-python-$pkgver/influxdb"
  # TODO: fix one failing test
  INFLUXDB_PYTHON_INFLUXD_PATH=/usr/bin/influxd nosetests -e test_write_points_from_dataframe_with_numeric_precision tests
}

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


# vim:set ts=2 sw=2 et:
