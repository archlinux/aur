# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-typing
pkgname=python-${_base}
pkgver=3.5.2
pkgrel=1
pkgdesc="Common type annotations for ethereum python packages"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8f897df94b14574016eea6e36222db4518e67a305896965a2ece6562190a9820a8729881713a8883391b2ba922dc5a68cc27e5b9b43af1da7ca163490fb432af')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
