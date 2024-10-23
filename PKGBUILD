# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-utils
pkgname=python-$_base
pkgver=5.1.0
pkgrel=1
pkgdesc="Common utility functions for python code that interacts with Ethereum"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-hash python-eth-typing python-hexbytes python-cytoolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('78bf14124150bb0da5cca17680cc67998bc1738eebc73941fc12f2d932845c377989e872bafb076f7f9bac806e27b0dd6d000dc21fa24c3d8e710157f0ec7d6e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
