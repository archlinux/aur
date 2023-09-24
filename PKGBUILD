# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.9
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
  'a7bd0b37d9a4780adf5138bda56180c26d45fa86f33d0fc271a629641bce9f60'
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
