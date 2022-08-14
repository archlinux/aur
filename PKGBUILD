# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matadi
pkgname=python-${_base}
pkgdesc="Material Definition with Automatic Differentiation"
pkgver=0.1.7
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(casadi)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('270deb0840711c7d03964a43dc8c05ef498a173b28f1dd5ce3a38076cc93c713eaaf61c24568b524c828bad355f05f300555149fe4ee19187326cc2b97a00eba')

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
