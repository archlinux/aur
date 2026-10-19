# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
pkgver=2.11.2
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-multipledispatch' 'python-tensorflow' 'python-tensorflow-probability' 'python-tabulate' 'python-typing_extensions' 'python-packaging' 'python-deprecated' 'python-lark-parser' 'python-check-shapes')
checkdepends=('python-pytest')
optdepends=('python-matplotlib: Image to tensorboard extra utility')
makedepends=('python-setuptools' 'findutils' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/GPflow/GPflow/archive/v${pkgver}.tar.gz")
sha256sums=('cebd8a23d793c3c30868a4cabb46a20e3367806b541c10dc3449a66ed76f7a76')

prepare() {
    # Do not install tests into site-packages root
    find "GPflow-${pkgver}/tests/" -name "__init__.py" -type f -delete
}

build() {
  cd GPflow-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd GPflow-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  python setup.py install --root=${pkgdir} --optimize=1
}
