# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipy-stubs
pkgname=python-${_base}
pkgdesc="Type annotations for SciPy"
pkgver=1.16.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-optype)
makedepends=(python-build python-installer python-hatchling)
optdepends=('python-scipy: for SciPy support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d226193ea21d94f9fc4c64bdb63db04350b52b2cf930ae79cebcb16a4edc6b42306940ad9af7213f5939d8e26fdc658c6737ff74ce912ef934b30b52c46b3468')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
