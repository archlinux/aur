# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=qdldl
pkgname=python-$_pyname
pkgver=0.1.7
pkgrel=2
pkgdesc='Python interface to the QDLDL free LDL factorization routine for quasi-definite linear systems'
url='https://github.com/oxfordcontrol/qdldl-python/'
license=(Apache)
arch=(x86_64)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11 cmake)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('6c86639d11e301e78af2cce885249a286f675cce96d0e6d60f5b14f859d0f10e')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
