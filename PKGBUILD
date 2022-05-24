# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=logzero
pkgname=python-${_base}
pkgver=1.7.0
pkgrel=1
pkgdesc="Robust and effective logging for Python"
arch=(any)
url="https://pypi.python.org/pypi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6c9647e81f16479a09b11383a9b6e7fb1068e61007cf9884d59469535706850a4ef2893d7393feb68dcdeb0793dcb8c41f8f3865289792de97dd20a5d32224bb')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package_python-logzero() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
