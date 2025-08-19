# Maintainer:
# Contributor: PumpkinCheshire <$(base64 --decode <<<'c29sbHlvbnpvdUBnbWFpbC5jb20=')>

pkgname='python-mercantile'
_name=mercantile
pkgver=1.2.1
pkgrel=3
pkgdesc='Spherical mercator tile and coordinate utilities'
arch=('any')
url='https://github.com/mapbox/mercantile'
license=('BSD-3-Clause')
depends=('python-click')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4437c29cf8ecf96f68e2dfa9e0abe1a125bd9d772d9ee7413d48cbf6092d9e01')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  # python-click >= 8.2.1 breaks this test (see commit msg)
  rm tests/test_cli.py
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
