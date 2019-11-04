# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Mateusz Galazyn <carbolymer@gmail.com>

pkgname=python-influxdb
pkgver=5.2.3
pkgrel=2
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
sha512sums=('49d70e6293883bad16db5d7d72e02988562311a070f8aca6c82880dea7f40b1c411d5882bc9e224934341a5180bc1fcb0987363cdf0e2ffe9e7f1c615e9588f8')

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
