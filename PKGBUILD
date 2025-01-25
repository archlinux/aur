# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypalettes
pkgname=python-${_base}
pkgdesc="A large collection of color maps for Python"
pkgver=0.1.5
pkgrel=1
arch=(any)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beautifulsoup4 python-pandas python-seaborn)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('51fc1e11980261e1d57a2662c3b0f72019a3ab4f227a8370647cf884859f4c02040deb35726f8fbcda2a64e2b2008bd28a93b5404ecccadf009a36f620bf7d86')

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
