# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-utils
pkgname=python-$_base
pkgver=5.0.0
pkgrel=1
pkgdesc="Common utility functions for python code that interacts with Ethereum"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-hash python-eth-typing python-hexbytes python-cytoolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('be231eae14fdfb3baeee20cf43fae57a7c9ab78b63630c5e18c8bf225719b241408be1eac07b49951059246cf850656e2a4a8eee92e4da8aa064e2718c586d66')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
