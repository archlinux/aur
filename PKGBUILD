# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=transonic
pkgname=python-${_base}
pkgver=0.7.3
pkgrel=1
pkgdesc="Make your Python code fly at transonic speeds!"
arch=(any)
url="https://foss.heptapod.net/fluiddyn/${_base}"
license=(BSD-3-Clause)
depends=(autopep8 python-beniget python-gast python-numpy)
makedepends=(python-build python-installer python-pdm-backend python-wheel)
# checkdepends=(python-pytest python-setuptools python-pythran)
optdepends=('python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs')
provides=(${_base})
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('71444c6635f534b7310656bd3cbf4a0f54b652c3ac0577eaea4c857e1396cf5a5aba24019409149e98104a9e6980a27999c1761f1db9a913d34c50b705973644')
build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests \
#     -k 'not init and not justintime and not install_package'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
