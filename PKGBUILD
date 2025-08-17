# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel@danielmoch.com>
_base=blurhash
pkgname=python-halcy-${_base}
pkgver=1.1.5
pkgrel=1
pkgdesc="Pure-Python implementation of the blurhash algorithm"
arch=(any)
url="https://github.com/halcy/${_base}-python"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
provides=(python-blurhash)
conflicts=(python-blurhash)
source=(${_base}-${pkgver}.tar.gz::/${url}/archive/v${pkgver}.tar.gz)
sha256sums=('da56b163e5a816e4ad07172f5639287698e09d7f3dc38d18d9726d9c1dbc4cee')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}