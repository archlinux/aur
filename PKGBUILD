# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=myokit
pkgname=python-${_base}
pkgdesc="A modeling and simulation tool for cardiac cellular electrophysiology"
pkgver=1.37.3
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(python-lxml python-matplotlib python-setuptools sundials)
makedepends=(python-build python-installer python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-sympy: for formats.sympy support'
  'python-scipy: for data log viewer support'
  'python-moviepy: for video support'
  'python-pyqt6: for gui support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('77465a987d869c925e68a296f716d05463d1435e239f80109cb488bf13e10ff32cf27ffc77a2675766dba224dd37de6197662290dea142204b97a7b28a283c55')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest ${_base}/tests \
#     --ignore=myokit/tests/test_simulation_cvodes.py \
#     --ignore=myokit/tests/test_simulation_log_interval.py \
#     --ignore=myokit/tests/test_protocol_floating_point.py \
#     -k 'not case_pk_model'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
