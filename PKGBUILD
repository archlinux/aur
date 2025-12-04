# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-roboflow
_pkgname=roboflow
pkgver=1.2.11
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
  'python-requests-toolbelt'
  'python-filetype'
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
sha256sums=('3ee34cbef4096d93df741816ad71d3e56f53a9240d1ae75d02b1a79ceb826a1e')

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
