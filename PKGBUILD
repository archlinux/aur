# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=hatch-deps-selector
pkgname=python-${_base}
pkgdesc="Select variants of your dependencies with environment variables"
pkgver=0.1.2
pkgrel=1
arch=(any)
url="https://github.com/jupyter-book/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-hatchling)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('34efa22174bc6830209bc5570973863d5faec8673a98e3444c682fdd55ae5b728f90c43e74330d34d5366e523906b2cd0ab7ddb855bc2ea00f4c7b27e2ba1aff')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
