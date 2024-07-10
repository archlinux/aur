# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.6.0
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-numpy python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('17076599d2b9295aa596ca0e4c68663e5091db06fc0b37b8866c6e331b675927dd062947788b3c0157707a9fc8788b6d245a31ba870fd66df8cad86cb61353ad')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     --ignore=tests/commit/backend/test__backend.py \
#     --ignore=tests/commit/math/test__functional.py \
#     --ignore=tests/commit/math/test__ops.py \
#     --ignore=tests/commit/math/test__optimize.py \
#     --ignore=tests/commit/math/test__tensors.py \
#     --ignore=tests/gpu/test_tf_cuda_resample.py
#     -k 'not csr_slice_concat' \
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
