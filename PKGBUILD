# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=paraview-trame-components
pkgname=python-${_base}
pkgdesc="Macro components for ParaView"
pkgver=0.16.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame python-trame-vtk python-trame-vuetify python-trame-components)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f3b47a3ecc077a4793ab5620c4af27e49ca74f4ad75b616688026db637ed8607c8f5bbe671cc91c7cfcdf3db03d28d795b11ee313d5b82ea9651f3c487b2de4a')

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
