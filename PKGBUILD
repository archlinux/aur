# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.0.4
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib python-openpyxl)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/NiaOrg/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('d74a528f1d0c79c5593054c958c5c450054f87bd9be12891ff373783040dbf643024bc32f9b40330d1bd0e6d5c920414c415ec1e832cccd25e81010a738f4678')

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
