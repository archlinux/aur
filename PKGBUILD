# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=PyUpSet
pkgname=python-${_base,,}
pkgver=0.1.1.post7
pkgrel=2
pkgdesc="Python implementation of the UpSet visualisation suite by Lex et al."
arch=(any)
url="https://pypi.python.org/project/${_base}"
license=(MIT)
depends=(python-pandas)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('91b01345f525ef7b4c2a1d6b29146631b089d435964527b44414759db0a1d885be54198ebc72bcef7817c761e0efda4513e57402514d2db8970deb7ee4fbddef')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
