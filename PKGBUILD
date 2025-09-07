# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.14.2
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base,,}-${pkgver}.tar.gz)
sha512sums=('ce92e7214c8cc836be122de1211c87644e361ab088492230582577441ee48e8da83a8b9fc1d726e88fdcd5a98b682e4f480e720fc75687621577c8c0b3e2a0a3')

build() {
  cd ${_base,,}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base,,}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     --ignore=tests/commit/backend/test__backend.py \
#     --ignore=tests/commit/math/test__functional.py \
#     --ignore=tests/commit/math/test__ops.py \
#     --ignore=tests/commit/math/test__optimize.py \
#     --ignore=tests/commit/math/test__tensors.py \
#     --ignore=tests/gpu/test_tf_cuda_resample.py \
#     -k 'not csr_slice_concat'
# }

package() {
  cd ${_base,,}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
