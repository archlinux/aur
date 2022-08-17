# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=pz
pkgname=python-${_base}
pkgdesc="Utility to substitute awk, sed and/or grep with Python"
pkgver=1.1.0
pkgrel=2
arch=(any)
url="https://github.com/CZ-NIC/${_base}"
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('469f883729a64e9f7b199b637c57e685a2270ab51c19ab8d1b07eac43dd338a477988fc34396985df03011b1be2f9f7894079e0cb73d981b7f959a998000b013')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python tests.py
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
