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
sha512sums=('24272e75a8f7417531b5e35e8e74649f50a101b382475ba478cff11dcb819c4cb2773a8a26d19ee0993cb9988d26a5b82a1dc108ec511e505ebaffef72668477')

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
