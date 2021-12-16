# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.14.7
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=('any')
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-pandas python-panel python-colorcet)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('2bf2637ed0cbb56e9333615e9c84a7c839e868af667101b101bf035ea93d599b09e2e35694693f8e2bb0fb8da35e7bfced44bcf2ddf706c5f06336201177379a')

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
