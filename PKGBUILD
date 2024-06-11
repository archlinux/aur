# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: GalSim developers team on GitHub
_base=GalSim
pkgname=python-${_base,,}
pkgver=2.5.3
pkgrel=1
pkgdesc="Modular galaxy image simulation toolkit"
arch=(x86_64)
url="https://github.com/${_base}-developers/${_base}"
license=('BSD-style')
depends=(python-astropy boost-libs eigen fftw python-coord python-future)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11 python-numpy)
# checkdepends=(python-pytest) # python-timeout python-scipy python-yaml
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('22051ba4bf9617eaef6f8279a346419a7cae6f31b152ba53b1c38e3064c6336a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/${_base}-${pkgver}/build/lib.linux-${CARCH}-cpython-${_pyversion}/${_base,,}" test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
