# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-typing
pkgname=python-${_base}
pkgver=3.5.1
pkgrel=1
pkgdesc="Common type annotations for ethereum python packages"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('014b75f3a547f2c30c91cf97b4ca479eabf7c307f1ac6248c24611df4c45e0a3554b4cb4de818fd7dc1d9c6d9773ba45e1c0de79bceb9a0767dc971c4d0ed46e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
