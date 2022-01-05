# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=niapy
pkgname=python-${_base}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=('any')
license=('MIT')
depends=(python-pandas python-matplotlib python-openpyxl)
checkdepends=(python-pytest)
source=(https://github.com/niaorg/${_base}/archive/$pkgver.tar.gz)
sha512sums=('77e8d16fd02671154605b21e4d32225ded0d53bd8e809d4f99d6449db33a915d669bb7c864935251c7842bfd8d0c20d30d77f2a8b538e03d104691f90553f034')

build() {
  cd "NiaPy-${pkgver}"
  python setup.py build
}

check() {
  cd "NiaPy-${pkgver}"
  python -m pytest
}

package() {
  cd "NiaPy-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
