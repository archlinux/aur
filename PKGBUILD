# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=shenfun
pkgname=python-${_base}
pkgver=4.2.0
pkgrel=1
pkgdesc="High performance computational platform in Python for the spectral Galerkin method"
arch=(x86_64)
url="https://github.com/spectralDNS/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py-fft python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest python-yaml python-sympy python-numba)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9cbc31c23099e98c99b561cd75f619100ec264a129b67a8dbb3fb8f0817334d36b1db396d22ba9a102cff74fe16923fa5b18d16e8d220ca7600d24be176382a3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
