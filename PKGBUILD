# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.14.0
pkgrel=1
pkgdesc="Quickly and accurately render even the largest data"
arch=(any)
url="https://${_base}.org"
license=('custom')
depends=(python-dask python-datashape python-numba python-pillow python-xarray python-colorcet python-scipy)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('a3cfdc11b9247040140deb03a93f80898b98ea01abe96031b721252e93db47b55618e992deae0cc34dfa05869eebf80f5eb84db6f5ecb6a1c01752d0bf6e7794')

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
