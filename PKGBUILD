# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=paraview-trame-components
pkgname=python-${_base}
pkgdesc="Macro components for ParaView"
pkgver=0.8.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame python-trame-vtk python-trame-vuetify python-trame-components)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('59c410848f54c55e4aecb147407e29c61bf09bd2f97b48bd68e57da9451dda99069742167f869a0b63d0588f28b7173a7658bbb2e80afa45a7ef4a8692da8603')

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
