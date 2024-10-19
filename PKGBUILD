# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
_base=scikit-umfpack
pkgname=python-${_base}
pkgdesc="Python interface to UMFPACK sparse direct solver"
pkgver=0.4.1
pkgrel=1
arch=(x86_64)
url="https://${_base}.github.io/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy suitesparse)
makedepends=(python-build python-installer meson-python python-wheel swig)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('b532decd09d1e61b772c1241b4722460a83a30cdc09f38914aafe4fea1f59e458cbfd6d01b94611cb21097d13ddf0b7326039f0a7874ee44787b97ab75e04c9b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
