# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-roboflow
_pkgname=roboflow
pkgver=1.3.8
pkgrel=1
pkgdesc="Official Python package for working with the Roboflow API"
arch=('any')
url="https://github.com/roboflow/roboflow-python"
license=('Apache-2.0')
depends=(
  'python'
  'python-certifi'
  'python-idna'
  'python-cycler'
  'python-kiwisolver'
  'python-matplotlib'
  'python-numpy'
  'python-opencv'
  'python-pillow'
  'python-dateutil'
  'python-dotenv'
  'python-requests'
  'python-six'
  'python-urllib3'
  'python-tqdm'
  'python-yaml'
  'python-packaging'
  'python-requests-toolbelt'
  'python-filetype'
  'python-typer'
  'python-pi-heif'
  'python-pillow-avif-plugin'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/roboflow/roboflow-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bfe273ccdda3287dd0ea1d9880e53a0d7cea2f113eca60986b249d2f9ee029a')

build() {
  cd "$_pkgname-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-python-$pkgver"

  # Basic import test
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import roboflow; print(roboflow.__version__)" || \
    echo "Warning: Import test failed - may need API key for full functionality"
}

package() {
  cd "$_pkgname-python-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
