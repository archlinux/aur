# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.6.1
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-coincurve: for CoinCurveECCBackend support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('91e1f5317c3791581b2e16087a175e098a732dc64826a6d287a3912829d8027d52d881389aaab4b79c1d422a2aacfce89223c61a8c6d55f923600d4f27e76417')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
