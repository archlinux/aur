# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.14.1
pkgrel=1
pkgdesc="Quickly and accurately render even the largest data"
arch=(any)
url="https://${_base}.org"
license=('custom')
depends=(python-dask python-datashape python-numba python-pillow python-xarray python-colorcet python-scipy)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('dab48dda9fba99934de25bb24a930fa0621329abbca12b81351a654a2b0114ba51bb0bfdacdbda81024313b5d0df604195413d94a3ea87eb24f4e742ecdb9055')

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
