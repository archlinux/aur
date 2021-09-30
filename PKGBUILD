# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lsq-ellipse
pkgname=python-${_base}
pkgdesc="Fitting an Ellipse using a Least Squares method, in Python"
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e26cd66a02000f43a95f780b41871a27cfd567254a5bf3fa236755d6d1fa29dd69970103dfa5af300fef4ec31ecbcd45c098dd80c0e7b43079d62a5bc4a6c9e8')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   PYTHONPATH="$PWD/build/lib/:$PYTHONPATH" python test.py
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
