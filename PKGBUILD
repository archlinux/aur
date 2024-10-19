# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.9.3
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0c2d259c8760dfc6eb336355037e9520ada38d0b8d6fa4b18b31754d68a5d0773dde554619e3d33e462876d4d11b319b8754e5d1ce027503e0db473c48712262')

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
#     --ignore=tests/gpu/test_tf_cuda_resample.py \
#     -k 'not csr_slice_concat'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
