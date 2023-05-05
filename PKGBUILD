# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-erddapy
pkgdesc='Retrieve scientific datasets from ERDDAP servers'
pkgver=2.0.1
pkgrel=1
url='https://ioos.github.io/erddapy/'
arch=('any')
license=('BSD')

depends=(
  'python-httpx' 'python-netcdf4' 'python-pandas' 'python-pytz' 'python-xarray'
)
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
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
  'a24afc1f47a7dd06759c7f92dd4e9e2b4c9edeec5b8c591c7511e72a9eced1de'
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
