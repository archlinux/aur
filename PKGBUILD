# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypalettes
pkgname=python-${_base}
pkgdesc="A large collection of color maps for Python"
pkgver=0.1.6
pkgrel=1
arch=(any)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beautifulsoup4 python-pandas python-seaborn)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('23a2a0a3883eb2d8309e669eb85acdb507979be497475c585ce15ea1e2211344a653eb5a356e591a0ea27771e86e47771fc14121f1bc40e2c0a7735cf13e09b4')

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
  install -Dm 644 LICENSE.note -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
