# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=shenfun
pkgname=python-${_base}
pkgver=4.2.1
pkgrel=1
pkgdesc="High performance computational platform in Python for the spectral Galerkin method"
arch=(x86_64)
url="https://github.com/spectralDNS/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py-fft python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest python-yaml python-sympy python-numba)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('156a01561ea68d89fffce000fb75ba40192a1f4f75087adf0ff34402865abd66d7c1d0b76908c69d29a2bde1ff725f7f71cd3fea23c1183a11d46058f09ba01b')

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
