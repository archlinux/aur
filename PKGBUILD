# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ambivalent
pkgname=python-${_base}
pkgdesc="Styles for Matplotlib"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://github.com/saforem2/${_base}"
license=(MIT)
depends=(python-matplotlib python-seaborn python-requests python-colormaps)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('603ccfa01fd77ab48b6b06981b3d08ecfd17c6f9d3bb3973bb59fc7130da5bc2777004d55a1db2d5cc109eea90cdb7105f2784384f77122e85ea5cc2af804381')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
