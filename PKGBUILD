# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=porepy
pkgname=python-${_base,,}
pkgver=1.13
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
sha512sums=('f7d85cf9989f4e1aca2408494f99660463091291ffcdcdc01c768f6a7147b39ba9a8ee0b2e447b6c415980d67d100bd38c4fbeacb5c96ece6f82664f674bdcad')

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
