# Maintainer:
# Contributor: a821 at mail de
# Contributor: AlD

pkgname=python-pysma
pkgver=0.7.5
pkgrel=2
pkgdesc="Async library for SMA Solar's WebConnect interface"
arch=(any)
url="https://github.com/kellerza/pysma"
license=('MIT')
depends=('python-jmespath' 'python-aiohttp' 'python-attrs')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-aiohttp' 'python-aioresponses' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ae2ec7d1c36e513142a51eab801ddc1319762e1aef6ebc31035c58d8a9d03edb')

build() {
  cd pysma-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pysma-$pkgver
  pytest
}

package() {
  cd pysma-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
