# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tabcompleter
pkgname=python-${_base}
pkgdesc="Autocompletion in the Python console"
pkgver=1.3.0
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('371830614a59bbb1a99cd6751a3aa553ee703351f4832a855da24ab902faee76a44f36bfc67efa02768680a74ca8296ef72f05f9ecc9d26a3c864858ace9ad8a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
