# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-crowdin-api-client
pkgdesc='Lightweight interface to the Crowdin API'
pkgver=1.20.0
pkgrel=1
url='https://support.crowdin.com/api/v2/'
license=('MIT')
arch=('any')

depends=(
  'python-deprecated'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-requests-mock'
)

_pkgname=crowdin-api-client-python
_pyname=crowdin_api_client
source=(
  "git+https://github.com/crowdin/crowdin-api-client-python.git#tag=$pkgver"
)
sha256sums=(
  '2c09f08e413e44b83af6f6bca918b874942d89a2c2c0297286f2dbc3595b28e5'
)

build() {
  cd crowdin-api-client-python
  python -m build --no-isolation --wheel
}

check() {
  cd crowdin-api-client-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd crowdin-api-client-python
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
