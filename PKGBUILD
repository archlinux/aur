# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=paraview-trame-components
pkgname=python-${_base}
pkgdesc="Macro components for ParaView"
pkgver=0.13.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame python-trame-vtk python-trame-vuetify python-trame-components)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('faaae5759d5e2589e357777ee2cfd4b37930a9c488887f85628db881e8ab3e4d552582de204951b697201237cef95319098f21cd847256ef1ab39277e3792daa')

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
