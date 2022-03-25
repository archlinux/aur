# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lsq-ellipse
pkgname=python-${_base}
pkgdesc="Fitting an Ellipse using a Least Squares method, in Python"
pkgver=2.2.0
pkgrel=1
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('9b846fe025fa86c53827ed7fa2964c100763aed5e3303d67748d493bd6e1d657a4fe18bb368f90f09d6ac34b995d99cb865f2cb290e3cbeef05c11d1e0a17f0f')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}
#   PYTHONPATH="$PWD/build/lib/:$PYTHONPATH" python test.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
