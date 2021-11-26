# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=odo
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=2
pkgdesc="Data Migration for the Blaze Project"
arch=('any')
url="https://github.com/blaze/${_base}"
license=('BSD')
makedepends=(python-setuptools)
depends=(python-datashape python-pandas python-dask python-networkx)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('661912ad34a72df0991366f8f42a5359855f8e3d01abbad52c2b327069dc67d4af2f76c73710a1b614f6cfda9fa2eeda93eec0365cc126a5a15fb4ca6a449557')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package_python-odo() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
