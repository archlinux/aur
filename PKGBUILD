# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-erddapy
pkgdesc='Retrieve scientific datasets from ERDDAP servers'
pkgver=2.2.4
pkgrel=1
url='https://ioos.github.io/erddapy/'
arch=('any')
license=('BSD-3-Clause')

depends=(
  'python-httpx'
  'python-netcdf4'
  'python-pandas'
  'python-pytz'
  'python-xarray'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=(
  'python-joblib: parallel searching'
)

_pypi=erddapy
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'dbb9bcb7335a52d73e3a23e7cdd976e8ef84452f1d1ee3e9f99c974ff7dcd57b'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
