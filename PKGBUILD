# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.6
pkgrel=1
arch=('x86_64')
license=('LGPL3')
depends=('gcc-libs' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose')

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '780b693d0555b857d7aab31e35d4293bf4ebdb9dec7a45ba4bb23b4400f626dc'
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
