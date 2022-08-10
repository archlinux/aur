# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.14.2
pkgrel=1
pkgdesc="Quickly and accurately render even the largest data"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-dask python-datashape python-numba python-pillow python-xarray python-colorcet python-scipy) #python-requests
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('fef35a7d5759ba75d33af625dc1c01a6f3cb8798458b297c987fdf135a8568a86e2f24161c79f595e93aaac8da5af7aba3cf9ba0c19fb9d23afaf399e12758dd')

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
