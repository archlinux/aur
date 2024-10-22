# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.6.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-coincurve: for CoinCurveECCBackend support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('321e14b16c6edb944a7536e9cf3abfbce8ec0643c5fa4da2b02afb66612f17e05c50cf757740aa86a0245a648496e60c31f9ae8d862d5bd7ddf936e04e68ab2f')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
