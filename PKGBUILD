# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=datashader
pkgname=python-${_base}
pkgver=0.14.4
pkgrel=2
pkgdesc="Quickly and accurately render even the largest data"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-colorcet python-dask python-datashape python-numba python-pillow python-scipy python-xarray)
makedepends=(python-build python-installer python-wheel)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('65ea2bca4b2017a817c7eae189760495c909987d5f052c3aa94adac20d36582969087645975a307e9b7a99d48bec2e52624489b8c0d026b2d94d722b6b638e14')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
