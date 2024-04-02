# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-utils
pkgname=python-$_base
pkgver=4.1.0
pkgrel=1
pkgdesc="Common utility functions for python code that interacts with Ethereum"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-hash python-eth-typing python-cytoolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('011f17f4ecf3c9116f79baad722b94554c4621dc0a72ef80b62bf106975a7d270daa9ed0572e78358f71674c6cb27566513c1cf2a64f2ce564840958b1222613')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
