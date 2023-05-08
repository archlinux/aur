# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=accupy
pkgname=python-${_base}
pkgdesc="Accurate sums and dot products for Python"
pkgver=0.3.6
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-mpmath python-pyfma eigen)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11)
# checkdepends=(python-pytest python-perfplot) # python-pytest-cov
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('08d1546b60803230002c1cfbb0ee2dca5e7abd59a304c339a577d4340eff2b56c8fc64ac2b46f4f5a11f8a4f4df190f6cfbb792fca6ec3a8222649f937d4e9a7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
#   # PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}"
#   # python -m pytest # --codeblocks
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
