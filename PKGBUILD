# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.14.9
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-pandas python-panel python-colorcet)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('135c5cc428b0d54ae4f375fdd5ba1e32d5ad2c29eb01af50fb97813ac3bd0bf6dbd82b36c3db6ad640f15adca881d9f0eadcf1cab1f0fd79006f38f551813000')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
