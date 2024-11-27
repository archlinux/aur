#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-numpy-stl
pkgver=3.2.0
pkgrel=1
pkgdesc="Library to make working with STL files (and 3D objects in general) fast and easy"
url="https://github.com/WoLpH/numpy-stl/"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'glibc'
  'python-numpy'
  'python-utils'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'xorg-server-xvfb'
)

source=(
  "numpy-stl-v${pkgver}.tar.gz::https://github.com/WoLpH/numpy-stl/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'e9c48258b74c7d575f038863c18437842930848c4dbbc199b24723394fb092c2'
)

build() {
  cd "numpy-stl-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "numpy-stl-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"numpy_stl-$pkgver"*.whl
  test-env/bin/python -m pytest -vv tests --cov-fail-under=50
}

package() {
  cd "numpy-stl-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"numpy_stl-$pkgver"*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
