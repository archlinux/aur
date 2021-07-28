# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=abydos
pkgname=python-${_pkg,,}
pkgver=0.5.0
pkgrel=2
pkgdesc="NLP/IR library for Python"
arch=(any)
url="https://github.com/chrislit/abydos"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(
    python-pytest
    python-deprecation
    python-nltk
)
# No tests in PyPi tarballs
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(${url}/archive/v${pkgver}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('0d46be1a40cfcdcd9ff9d052828c6ea57f5e1e2378373761c963c4a0cfcc5512')

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  rm setup.cfg
  pytest
}

package() {
  cd ${_pkg}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
