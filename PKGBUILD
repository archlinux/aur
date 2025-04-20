# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-utils
pkgname=python-$_base
pkgver=5.3.0
pkgrel=1
pkgdesc="Common utility functions for python code that interacts with Ethereum"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-hash python-eth-typing python-hexbytes python-cytoolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6ec15821b38f7f22c814590518f277bf681617a3b69377cb6e534b73192bc01545adacda8d817bc56fd8618a257bfd57df980d4f0080e30b28d47ddfa81900ff')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
