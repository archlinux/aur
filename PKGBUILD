# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Tanel K <tanel.kiis@gmail.com>
_base=pomegranate
pkgname=python-${_base}
pkgver=1.0.4
pkgrel=1
pkgdesc="A PyTorch implementation of probabilistic models"
arch=(x86_64)
url="https://github.com/jmschrei/${_base}"
license=(MIT)
depends=(python-scikit-learn python-pytorch python-apricot-select python-networkx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-nose)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8943c0c00b119087ac26173d5651a24ab6e3909f27d08ad0e3decbf719be3b0fed17f63a9d1bdb69f545f0e4a3aae2e89b95f888ba4b7e3456abb15ddeb0b133')

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
