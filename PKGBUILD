# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
_base=pyevtk
pkgname=python-${_base}
pkgver=1.7.0
pkgrel=2
pkgdesc="Export data as binary VTK files"
arch=(any)
url="https://github.com/pyscience-projects/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-versioneer)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ba29bdb42c424c58a424e41022e81bd803b5ec73b66faf9f56b9c743e11339ef6881959ac29017fc114d59c97a663d244577f6ca7b3ed0eecd3606806e95539c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
