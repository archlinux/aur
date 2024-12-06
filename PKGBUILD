# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=shenfun
pkgname=python-${_base}
pkgver=4.2.2
pkgrel=1
pkgdesc="High performance computational platform in Python for the spectral Galerkin method"
arch=(x86_64)
url="https://github.com/spectralDNS/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py-fft python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest python-yaml python-sympy python-numba)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('e06287794dec34feb9306b74edd31c9a9f59f5bcf3376b9d30476afb74e92a5d31fc9602f72fbb93ae094eaf953319ba856fcccd6d1b14d98af3b1ff8f02d7f1')

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
