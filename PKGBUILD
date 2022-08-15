# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matadi
pkgname=python-${_base}
pkgdesc="Material Definition with Automatic Differentiation"
pkgver=0.1.9
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(casadi)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6ea83e8aa97070d81ef339991ccb8c51d2e804a1860d9bd6fbd931ad26326207dcf72b549aa44f7b82f951262a71ea90b313c9612cf0d4aa11ecf87b280a2b77')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
