# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dreieck <oid-maps@seznam.cz>
_base=fortranformat
pkgname=python-${_base}
pkgdesc="Mimics Fortran textual IO in Python"
pkgver=2.0.3
pkgrel=1
arch=(any)
url="https://github.com/brendanarnold/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e6a02c32f65b55bd7524d36e2fbcd7479d333db828a3d5a184b0a110369223d8335bade43e1882d261b8a1377e3e97bcd1e505992344523d5eb6cbea3cefe359')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
