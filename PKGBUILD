# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypalettes
pkgname=python-${_base}
pkgdesc="A large collection of color maps for Python"
pkgver=0.1.2
pkgrel=1
arch=(any)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-beautifulsoup4)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('191584c4fee83b75438252fc859a5d4a5f57524b7d7f4e70b2809dedd29c8f328e4cf9a3c5eb350295977eeef29e7f55e1b9015584fd10a67df2ee2c5c6e59e1')

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
