# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=3.1.2
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL-3.0-or-later)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c70e230138a2f0b45ea786ad745901e0de2392c507a631af14436bac33e31749013db516232eb5f6b5496f4096538dc7505f5fd6d2efe6765680ec92a92e6791')

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
