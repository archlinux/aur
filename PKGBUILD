# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=paraview-trame-components
pkgname=python-${_base}
pkgdesc="Macro components for ParaView"
pkgver=0.14.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame python-trame-vtk python-trame-vuetify python-trame-components)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d9e620867a8fa37b71e110f36fa131dfad97a8d92ababb9bd3685e8a75c5fb166cc30b0571ecd15cfda6e02528148ea4af98259ff22a523b3370e3bd40502604')

prepare() {
  sed -i 's/^semantic-release/#semantic-release/' ${_base}-${pkgver}/pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
