# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-coincurve: for CoinCurveECCBackend support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('d9de91de10e8fbede67105661a8fa627e07b4b6670e210378e4a320d87ed7c8429f7628607d93b97eee656c734d7ada04f70828fa30193311d3c5af4a8c92315')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
