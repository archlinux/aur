# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=msgcheck
pkgname=python-${_base}
pkgdesc="Gettext file checker"
pkgver=4.0.0
pkgrel=2
arch=(any)
url="https://github.com/flashcode/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pyenchant aspell-en aspell-fr libxml2)
optdepends=('enchant: for check PO files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4785d97eaa2b22dbb1aba34beb51705b8a6ba5edac5dcb03680d9588147af4b7dc629a7a8dea90b7516228f315a0b4ff0ce852c87a5f05641890ea3703e08716')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
