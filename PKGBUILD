# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-typing
pkgname=python-${_base}
pkgver=4.2.0
pkgrel=1
pkgdesc="Common type annotations for ethereum python packages"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('510bf794136cb8b7d7b972e4df5c17b35a6f0f8b0ba3d979c0d16e4bf9d26cb387e48191b2efa9709ca76aa67064276cba471e25d39ff7176938e737ad2c9f57')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
