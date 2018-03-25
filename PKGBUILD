# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=python2-influxdb
pkgver=5.0.0
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=(any)
url=https://github.com/influxdb/influxdb-python
license=(MIT)
depends=(python2 python2-dateutil python2-six python2-pytz python2-requests)
optdepends=(influxdb python2-pandas)
options=(!emptydirs)
source=("https://github.com/influxdb/influxdb-python/archive/v$pkgver.tar.gz")
sha256sums=('7ff7427fb90dcdedc44b68def0d9a04b800d0ddf842fadd51d03034708b8dce0')
source+=(LICENSE)
sha256sums+=(70146f78d168b33ac5903490a918469e22a801a8d3a81103f3d8706dc0024c9a)

build() {
  cd "$srcdir/influxdb-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  if [[ -f LICENSE ]]; then
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
