# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.13.0
pkgrel=3
pkgdesc="Quickly and accurately render even the largest data"
arch=('any')
url="https://${_base}.org"
license=('custom')
depends=(python-dask python-datashape python-numba python-pillow python-xarray python-colorcet python-scipy)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('b51628ad2eb9842d1dc043c655b5373d9b71ef139c470ae62113960a13977049faae2bc03cdba3d03370bcaad80453ae333630fb6fd2a33162234956119e01c2')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
