# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-daltonlens
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=4
pkgdesc="R&D companion package for the desktop application DaltonLens"
arch=('any')
url="https://github.com/DaltonLens/DaltonLens-Python"
license=('MIT')
depends=(
  'python-numpy'
  'python-pillow'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-git'
  'python-wheel'
)
# checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f01f41c4d865ce2e39ea98e8f5d173d63ea13b9761bb753394678b9b8c0647c')

build() {
  cd "DaltonLens-Python-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "DaltonLens-Python-$pkgver"
#   python -m venv --clear --without-pip --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -P -m pytest
# }

package() {
  cd "DaltonLens-Python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
