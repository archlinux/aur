# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.15.0
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base,,}-${pkgver}.tar.gz)
sha512sums=('f1f75957d36f14f6c0a127505e1710bacf01b46b969185e30a2f278bd9074f424398f9277fc08bc1ac25ea93f150f4c73fda9bfcf28bd4bdd983a6be60a5236d')

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
