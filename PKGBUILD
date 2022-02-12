# Contributor: Christian Schwarz <me@cschwarz.com>
_base=Phidgets
pkgname=python-${_base,,}
pkgver=2.1.8
pkgrel=2
pkgdesc="Python Wrapper library for the Phidgets API"
arch=(any)
url="https://pypi.python.org/pypi/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('91a6b073f75d0d96c0c8eea226c5946e1da1a157c89cb9f9e15040b59151af7421461e36e8037dd5c80fcc271bec6f93ba4d3919b303de46f13c155632fd5f63')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
