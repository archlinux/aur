# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sympde
pkgname=python-${_base,,}
pkgdesc="Symbolic calculus for partial differential equations"
pkgver=0.19.1
pkgrel=1
arch=(any)
url="https://github.com/pyccel/${_base}"
license=(MIT)
depends=(python-sympy python-h5py python-pytest python-yaml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('05a0a7cb6b40f251b9c296a3314a20ba7d2ff1e03d652002409b22516c19484d74c2413f52ad0d3cde755b1aab04f4b4cefeeb59febb9f2741927549d2268745')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
