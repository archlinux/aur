# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
_base=numdifftools
pkgname=python-${_base}
pkgver=0.9.40
pkgrel=1
pkgdesc="Solve automatic numerical differentiation problems in one or more variables"
url="https://github.com/pbrod/${_base}"
license=('custom:BSD-3-clause')
arch=('x86_64')
depends=(python-algopy python-statsmodels)
makedepends=(python-setuptools python-pytest-runner)
checkdepends=(python-pytest python-hypothesis python-matplotlib)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('241a9031e6852587a496f0eb9bb3f5d30c00d2d0f55c211e3b4454e0e1eff72d933e5d0013669ac70111b9422f816c3ea636d486d93c55b239a75360c9e21426')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest "src/${_base}/tests"
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
