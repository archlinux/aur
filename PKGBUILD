# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.0.5
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib python-openpyxl)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/NiaOrg/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('371aa8237c0b821ffb07bc12a2e9def1bcedce2ac8d217bd41eda5a792ffa386bea3be8d52b1db304b6706fa9d4e8fe93e44e7ab93b58374ba78cde40f95b34d')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
