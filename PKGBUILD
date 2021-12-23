# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=lsq-ellipse
pkgname=python-${_base}
pkgdesc="Fitting an Ellipse using a Least Squares method, in Python"
pkgver=2.1.0
pkgrel=2
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('2e31943e5df37531cde050d5b21d704233a9db56af66367257ac398b57bef221eda9d0bb1f28e2bab0c4daef1ee355b9772ca581d7690a29a1e7758f24279753')

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
