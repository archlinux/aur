# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.14.6
pkgrel=2
pkgdesc="With Holoviews, your data visualizes itself"
arch=('any')
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-pandas python-panel python-colorcet)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('309c808e9c48cb763d882515b7bb85890abb86009451dc4f54bee6f8190cf180840d838bf824839aabea4cb425e133bab53ef9de825d01bf741f67e1c1e1d120')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
