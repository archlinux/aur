# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-typing
pkgname=python-${_base}
pkgver=3.4.0
pkgrel=1
pkgdesc="Common type annotations for ethereum python packages"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6e73ccecd3b92f2f4946fd0d3a46f3ef4d06a0c5876ab908be930b2c751b4b909f01266ef4973baf1df83e1c02087b4b068f2450aded682fcdf42f21558b8280')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
