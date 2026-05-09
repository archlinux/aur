# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=finitediff
pkgname=python-${_base}
pkgdesc="Finite difference weights for any derivative order on arbitrarily spaced grids"
pkgver=0.6.5
pkgrel=2
arch=(any)
url="https://github.com/bjodah/${_base}"
license=(BSD-2-Clause)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('eebffa81780294ebdde6a46165e7c8180abfa4873e1595ee79a58adb6995fc1711b6c4c6366b016654af27d2c99c87a2172b6d43391d086614dc71e4730a18bd')

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
