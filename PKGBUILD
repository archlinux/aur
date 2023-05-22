# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
_base=GalSim
pkgname=python-${_base,,}
pkgver=2.4.9
pkgrel=1
pkgdesc="Modular galaxy image simulation toolkit"
arch=(x86_64)
url="https://github.com/${_base}-developers/${_base}"
license=('BSD')
depends=(python-astropy boost-libs eigen fftw python-coord python-future)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11 python-numpy)
# checkdepends=(python-pytest) # python-yaml python-pandas
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('b79fc96e6a6a969f29eaecb2e5b8a7bb9cc2bb4981b56382de09e9a0e1893663d8edae1f7ce065e1fac2c7e2cab9c8de9c80a52d2e033400d53b27fb09da516c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
#   PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_py" nosetests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
