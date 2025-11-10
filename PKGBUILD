# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypalettes
pkgname=python-${_base}
pkgdesc="A large collection of color maps for Python"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beautifulsoup4 python-pandas python-seaborn)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('65d217340ed907af5aef965646b3fa7adcd4249850bbc9507f4dc416bb03958491ad1e1d54a08d03b961af1f27cdb2b6fc64478a472f6015591915492fdde682')

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
