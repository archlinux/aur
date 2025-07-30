# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=paraview-trame-components
pkgname=python-${_base}
pkgdesc="Macro components for ParaView"
pkgver=0.14.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame python-trame-vtk python-trame-vuetify python-trame-components)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cb94969a9bcc971086a6b69aea05e4dae44a22961433dbf5796b41d3608e2899b570c9d2778182a586b05a753cc4e5afa399109553a0c0b4dc547eca949f0690')

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
