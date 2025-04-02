# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sympde
pkgname=python-${_base,,}
pkgdesc="Symbolic calculus for partial differential equations"
pkgver=0.19.2
pkgrel=1
arch=(any)
url="https://github.com/pyccel/${_base}"
license=(MIT)
depends=(python-sympy python-h5py python-pytest python-yaml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b6c12b76a6dbb52eaab32c5a7f472b5d2c03d66c26f8d54b04db5cbf0da45f7a2501fbcdcfb246b8817f79fc676ef6b97e365b2a1884401cdc6d6c9090b5df49')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
