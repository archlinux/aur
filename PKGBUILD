# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pyvhdlmodel
pkgdesc='An abstract VHDL language model'
pkgver=0.28.0
pkgrel=1
arch=('any')
url='https://github.com/VHDL/pyVHDLModel'
license=('Apache-2.0')

depends=(
  'python-pytooling'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)

_pyname=pyVHDLModel
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/VHDL/pyVHDLModel/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '261846640e113a6dee241e5888a74951e0c6c074c1aafd7132aa676db17dc195'
)

build() {
  cd "$_pyname-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pyname-$pkgver"
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/"$_pyname-$pkgver"*.whl
  testenv/bin/python -m pytest -v tests/unit
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"$_pyname-$pkgver"*.whl
}
