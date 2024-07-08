# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=3.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL-3.0-or-later)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bafc3e6615738666a596c2833474bde600466dc6a7ea551fff150decf198db83733986028f087d135ba7d36c3c230f501e79c33b854465df26f1fa6baa6feb5b')

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
