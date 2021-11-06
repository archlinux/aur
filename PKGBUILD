# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.4
pkgrel=1
arch=('x86_64')
license=('LGPL3')
depends=('gcc-libs' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=('python-nose')

source=(
  "https://files.pythonhosted.org/packages/source/p/pykdtree/pykdtree-$pkgver.tar.gz"
)
sha256sums=(
  'bebe5c608129f2997e88510c00010b9a78581b394924c0e3ecd131d52415165d'
)

build() {
  cd "pykdtree-$pkgver"
  python setup.py build
}

check() {
  local PYVER=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd "pykdtree-$pkgver/build/lib.linux-$CARCH-$PYVER"
  PYTHONDONTWRITEBYTECODE=1 nosetests
}

package() {
  cd "pykdtree-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1
}
