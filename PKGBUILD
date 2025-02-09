# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Tanel K <tanel.kiis@gmail.com>
_base=pomegranate
pkgname=python-${_base}
pkgver=1.1.2
pkgrel=1
pkgdesc="A PyTorch implementation of probabilistic models"
arch=(x86_64)
url="https://github.com/jmschrei/${_base}"
license=(MIT)
depends=(python-scikit-learn python-pytorch python-apricot-select python-networkx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-nose)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('2c3a012e95972d7acf1de4f9b7b4728d88cb981b9d4f41333280488076c7cbad51bf79252dd398bf5f983a5c52e384189a1d933862b69259c0d3ac513923d3a5')

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
