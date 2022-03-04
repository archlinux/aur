# Contributor: Christian Schwarz <me@cschwarz.com>
_base=yoctopuce
pkgname=python-${_base}
pkgver=1.10.48220
pkgrel=1
pkgdesc="Yoctopuce python API"
arch=(any)
url="https://pypi.org/project/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('54bdc1ee3c446a8814fd95547cfb81f38e1ad2636f1ad8c3d99b470af5af88cf4820bb567bd3479df2cd9e5d0e0da39890d9bfaba8f5ed8d3b18ce366cfc9341')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
