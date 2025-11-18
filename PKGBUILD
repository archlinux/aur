# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=porepy
pkgname=python-${_base,,}
pkgver=1.12
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
sha512sums=('3f7fb38f659e7bf9f8fafc2fab4ec34b939775f9399cfc35c8c7e4f23fcd3dba6366984fbb6a5537de98c18340081b7433201a275c8724d0de439ce8e09185b8')

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
