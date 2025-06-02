# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
_pkgver=2.10.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-multipledispatch' 'python-tensorflow' 'python-tensorflow-probability' 'python-tabulate' 'python-typing_extensions' 'python-packaging' 'python-deprecated' 'python-lark-parser' 'python-check-shapes')
checkdepends=('python-pytest')
optdepends=('python-matplotlib: Image to tensorboard extra utility')
makedepends=('python-setuptools' 'findutils' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/GPflow/GPflow/archive/v${_pkgver}.tar.gz")
sha256sums=('28e36484fb7a474f0005eb4453d0bd120f88c62f42f267269d9b53e4bfa298b2')

prepare() {
    # Do not install tests into site-packages root
    find "GPflow-${_pkgver}/tests/" -name "__init__.py" -type f -delete
}

build() {
  cd GPflow-${_pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd GPflow-${_pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  python setup.py install --root=${pkgdir} --optimize=1
}
