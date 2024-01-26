# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-crowdin-api-client
pkgdesc='Lightweight interface to the Crowdin API'
pkgver=1.14.1
pkgrel=1
url='https://support.crowdin.com/api/v2/'
license=('MIT')
arch=('any')

depends=('python-deprecated' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-requests-mock')

_pkgname=crowdin-api-client-python
_pyname=crowdin_api_client
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/crowdin/crowdin-api-client-python/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  '4b37ac9fc3804500770fead90d6dbc26a450cf081072af5c095340dee4eb0781'
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pkgname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
