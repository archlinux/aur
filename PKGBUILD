# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.5
pkgrel=1
arch=('x86_64')
license=('LGPL3')
depends=('gcc-libs' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=('python-nose')

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '7342f75e731103e653fc1f6b9fdabc2410cf92b6e7b06160804a75786c9b5747'
)

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

check() {
  local PYVER=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd "$_pypi-$pkgver/build/lib.linux-$CARCH-$PYVER"
  PYTHONDONTWRITEBYTECODE=1 nosetests
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1
}
