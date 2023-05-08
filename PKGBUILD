# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
_base=algopy
pkgname=python-${_base}
pkgdesc="A library for Automatic Differentation in Python"
pkgver=0.5.7
pkgrel=2
arch=(any)
url="https://pythonhosted.org/${_base}"
license=('custom')
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.zip)
sha512sums=('1d2cb62154f7bc344605e2db1d90125a76b93e99628056ef007a27b05546d0af3e1d52587dc3217d03118f8dddac298742c303ae9d39185ab33375e56ae3a1ba')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
