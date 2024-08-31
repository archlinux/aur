# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypalettes
pkgname=python-${_base}
pkgdesc="A large collection of color maps for Python"
pkgver=0.1.3
pkgrel=1
arch=(any)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beautifulsoup4 python-pandas python-seaborn)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4fcfcf1659d42a3b4252346c1b1a78f1a6f83bc5e5cd9f5229dcddd7296e984cf4cd5f6beb922681713d67da361c61b9e6ad24cdf1488ef8d7f68dfad747d9fd')

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
