# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=3.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL-3.0-or-later)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4074a07132b5f6031eac2aeb91e8ab3785515634cde72718e2ecff135d253b4d102ae97806961ebb12f628af5c6017590b69f62eaf4492a3b4b24a07ff2060ae')

build() {
  cd python-bindings-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd python-bindings-${pkgver}
  # FIXME: https://github.com/precice/python-bindings/issues/1
  python setup.py test
}
package() {
  cd python-bindings-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
