# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=shenfun
pkgname=python-${_base}
pkgver=4.3.0
pkgrel=1
pkgdesc="High performance computational platform in Python for the spectral Galerkin method"
arch=(x86_64)
url="https://github.com/spectralDNS/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py-fft python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest python-yaml python-sympy python-numba)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c137a4d40e08632ec9e57b6609b60de64648045a886019f5441f5e5aae32c9920bfc891cd37f301260eecf85baf0a6d909e06061ec30a98d1153f305d93d7ac2')

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
