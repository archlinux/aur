# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=myokit
pkgname=python-${_base}
pkgdesc="A modeling and simulation tool for cardiac cellular electrophysiology"
pkgver=1.36.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(python-lxml python-matplotlib sundials)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
optdepends=('python-sympy: for formats.sympy support'
  'python-scipy: for data log viewer support'
  'python-moviepy: for video support'
  'python-pyqt6: for gui support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('703a9dce5e9548dff63fb9c13fc20ed241980cca9830d81767cbece5a081bc57fec19b8c32d7f7647ccb568ed5e5b1f0f40fd183c44ca53d8f61f0dd6cdad6c3')

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
