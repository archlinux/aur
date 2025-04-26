# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.34.0
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-poetry')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1208edaaffc4afc3ea306f74a28a989d0b83bb59e9c33eb4e20766684d4d86dd3b53efbc71fa5bd6dc1b3d1bb90a750eac86e9c7c872419ce7a4618603d888c5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
