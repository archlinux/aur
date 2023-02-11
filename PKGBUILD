# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=0.7.4
pkgrel=1
url='https://github.com/dranjan/python-plyfile'
arch=('any')
license=('GPL3')

depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

_pypi=plyfile
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '9e9a18d22a3158fcd74df38761d43a7facc6df75126f2ab9f4e9a5d4d2188652'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

check() {
  cd $_pypi-$pkgver
  PYTHONPATH=build/lib pytest -v
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License is copied to a weird location...
  rm "$pkgdir/usr/COPYING"
}
