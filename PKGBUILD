# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=contourpy
pkgname=python38-$_pyname
pkgver=1.0.6
pkgrel=1
pkgdesc='Python library for calculating contours in 2D quadrilateral grids'
arch=(x86_64)
url='https://github.com/contourpy/contourpy'
license=(BSD)
makedepends=(python38-build python38-installer python38-setuptools pybind11 python38-wheel)
depends=(python38-numpy)
checkdepends=(python38-pytest python38-matplotlib)
optdepends=('python38-matplotlib: matplotlib renderer')
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('6e459ebb8bb5ee4c22c19cc000174f8059981971a33ce11e17dddf6aca97a142')

build() {
  cd $_pyname-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
