# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-matlab
pkgname=python-${_base}
pkgver=1.3.1
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(any)
url="https://github.com/acristoffers/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('29bfada1db16d2c7a742cd1271a1b3778aa67fecd9a1e4a561178cd9ad47d6c1fe6b61e36494c104619f072dcf7f797060113bbbd9307633fc3ecb46a82f0e66')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
