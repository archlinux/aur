# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-coincurve: for CoinCurveECCBackend support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('bd173cb95fc21926496c37b5d9b826a10a22222be3634465a177bf5e691028daaff9b01b26dd60e10601d0027421b8b8034dcba8a7fa238ccc77a38016dad989')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
