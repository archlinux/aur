# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-utils
pkgname=python-$_base
pkgver=2.1.0
pkgrel=1
pkgdesc="Common utility functions for python code that interacts with Ethereum"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-hash python-eth-typing python-cytoolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aec131682186d9393663a84c93700610e37ffe6dab5a6b7e80ceca1c14b38b8b26a10b0bb6658526069e34ecddca8f9af1b037e741733731b7e42d6dd61c63aa')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
