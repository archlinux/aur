# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
_pkgver=2.10.1
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
sha256sums=('0a463cd843770d0f558695329b0b423dc1ccdd02a4fe5fd8132650e504b3710d')

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
