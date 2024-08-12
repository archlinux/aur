# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colormaps
pkgname=python-${_base}
pkgdesc="Collection of colormaps or color palettes for Python"
pkgver=0.4.2
pkgrel=1
arch=(any)
url="https://github.com/pratiman-91/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fbe427ca8ee64075942153f33b94778a9849e867ea73362614cd0416bbec9b8c4baa10ec1b92047007101e15df89517833ef73979620484bc8f6a772d610d14a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
