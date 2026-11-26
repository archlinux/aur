# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=porepy
pkgname=python-${_base,,}
pkgver=1.14
pkgrel=1
pkgdesc="Simulation tool for fractured and deformable porous media"
arch=(x86_64)
url="https://github.com/pmgbergen/${_base}"
license=(GPL-3.0-or-later)
depends=(python-deepdiff gmsh python-matplotlib python-meshio python-networkx
python-numba python-scipy python-seaborn python-shapely python-sympy python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest-runner)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('46f24d876deaf060cdf93568f6de7a8389424261120d4e863fa87224233403713ded8806c7757e0c29ca0c7e76407859b3811d774ce989ee6f10dd63043fff99')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
