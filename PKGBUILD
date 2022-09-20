# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-erddapy
pkgdesc='Retrieve scientific datasets from ERDDAP servers'
pkgver=1.2.1
pkgrel=1
url='https://ioos.github.io/erddapy/'
arch=('any')
license=('BSD')

depends=('python-netcdf4' 'python-pandas' 'python-pytz' 'python-requests' 'python-xarray')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=(
  'python-joblib: parallel searching'
)

_pypi=erddapy
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '618c7e07a8437d4fafb56fbc16da25cede92989e9bd5cf5a7be26e663e2a2d07'
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
