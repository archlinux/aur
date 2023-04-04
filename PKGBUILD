# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treestamps
pkgname=python-${_base}
pkgver=0.3.4
pkgrel=1
pkgdesc="Create timestamp records for recursive operations on directory trees"
url="https://github.com/ajslater/${_base}"
depends=(python-ruamel-yaml python-termcolor) # python-bandit python-flake8-eradicate
makedepends=(python-setuptools)
license=(GPL3)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4bbbca8e2d57abe6220b11bedde449178a38d87c7a6adabf1f19c0abcdd9497e616c9f4e72dd5972c74b82add427e12e673d882b76fbfa85e8129818ed15aac5')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}" python tests/unit/*.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
