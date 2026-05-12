# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=finitediff
pkgname=python-${_base}
pkgdesc="Finite difference weights for any derivative order on arbitrarily spaced grids"
pkgver=0.6.6
pkgrel=1
arch=(any)
url="https://github.com/bjodah/${_base}"
license=(BSD-2-Clause)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('b31a763cac3e722941a88daaa5e1f6875a4b9ead00e42619adaf714244df939d9d041c9623c20b564408c0c9b03f511c7267aac2e98f6fc9f8f337927693207e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}/examples
#   make
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
