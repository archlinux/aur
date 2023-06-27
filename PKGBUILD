# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tabcompleter
pkgname=python-${_base}
pkgdesc="Autocompletion in the Python console"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f714938d7fd22aa10ca3d1d326623353a05abbea70024a46f667e21beb532b9282f01538e6a1eb99762ce068c49d8b8fef5b636748416f33a487f3e574941d77')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
