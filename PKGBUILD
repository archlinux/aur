# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-crowdin-api-client
pkgdesc='Lightweight interface to the Crowdin API'
pkgver=1.28.0
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

source=(
  "git+https://github.com/crowdin/crowdin-api-client-python.git#tag=$pkgver"
)
sha256sums=(
  '60b52c92320c0e699ab5e35438b384b70e01011217de2974ae60a55bae8aea3c'
)

build() {
  cd crowdin-api-client-python
  python -m build --no-isolation --wheel
}

check() {
  cd crowdin-api-client-python
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/crowdin_api_client-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd crowdin-api-client-python
  python -m installer --destdir="$pkgdir" "dist/crowdin_api_client-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
