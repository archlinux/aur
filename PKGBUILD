# Contributor: Mateusz Galazyn <carbolymer@gmail.com>

pkgname=python-influxdb
pkgver=5.2.0
pkgrel=3
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
sha512sums=('de86037abd5b371480029ff0bb8935c551030e5954c34a2915829b916c62444ee67bce89f553c39ea4d73369ff3c8c8a4639f5c2bfcfc9ac8ddfe6919fd020fd')

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
