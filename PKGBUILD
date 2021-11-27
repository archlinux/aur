# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jean Lucas <jean@4ray.co>
_base=pandas-summary
pkgname=python-${_base}
pkgver=0.2.0
pkgrel=1
pkgdesc="An extension to pandas describe function"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-pandas)
# makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0c004be41aad3d04bf67cea15c54dde6a6114819c768ee7c21255ad824d75201c925262c7f1a879a85d61dd32e369dd1519137db065eb5e136ad3742a6ab6be1')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
