# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Tanel K <tanel.kiis@gmail.com>
_base=pomegranate
pkgname=python-${_base}
pkgver=1.1.1
pkgrel=1
pkgdesc="A PyTorch implementation of probabilistic models"
arch=(x86_64)
url="https://github.com/jmschrei/${_base}"
license=(MIT)
depends=(python-scikit-learn python-pytorch python-apricot-select python-networkx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-nose)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('d8fe497b02ebd2b287192906e96acf38c602f3452abf95d038aa7364341ef8de6a760c92a4317cb034464c9b416f15ca87398fa97115d31ecae128d816c98489')

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
