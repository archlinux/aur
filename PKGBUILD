# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbsphinx-link
pkgname=python-${_base}
pkgdesc="A sphinx extension for including notebook files from outside sphinx source root"
pkgver=1.3.1
pkgrel=1
arch=(any)
url="https://github.com/vidartf/${_base}"
license=(BSD-3-Clause)
depends=(python-nbsphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2a9e6cc7156f721ceeeeece6a432a8573aef31aaa7f61584fdc9b5d7a708faf12af274438f962eb444ac74a8021f093aa8ecd41c7d6934f2bf92dee183f8c397')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
