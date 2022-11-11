# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
_base=numdifftools
pkgname=python-${_base}
pkgver=0.9.41
pkgrel=1
pkgdesc="Solve automatic numerical differentiation problems in one or more variables"
url="https://github.com/pbrod/${_base}"
license=('custom:BSD-3-clause')
arch=(x86_64)
depends=(python-scipy)
makedepends=(python-build python-installer python-pytest-runner)
checkdepends=(python-algopy python-hypothesis python-statsmodels python-matplotlib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7eb26ca23238b1592a6d230d9b59d49e2574b97151de66fda158bc37e49e1598e7ca931628c9a163a2614a4e24bbb165f22b50ec043d43486d415123517c7148')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest "src/${_base}/tests"
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
