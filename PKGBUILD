# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=porepy
pkgname=python-${_base,,}
pkgver=1.11
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
sha512sums=('7f2425dfb29fc968f7d8b4aa71a7f62c6d296c999d4eacd6420bed77ee52d9f6281dae0bbb7c0a3c28f744eb40859dc3adbf74f4ec034d3f4a8426b89c0aa420')

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
