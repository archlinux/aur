# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.10
pkgrel=1
arch=('x86_64')
license=('LGPL3')
depends=('gcc-libs' 'python-numpy')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '41e7c5d669cadc2188acc4bbb4b0b4dcaf492d84512f1e6517a7ab2d122c911d'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$_pypi-$pkgver/build/lib.linux-$CARCH-cpython-${python_version}"
  nosetests
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
