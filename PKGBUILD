# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-crowdin-api-client
pkgdesc='Lightweight interface to the Crowdin API'
pkgver=1.13.0
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
  '3e9c832cb6694d53f38661d72008843d1c9d7647d99679549ec77b24fe36455d'
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
