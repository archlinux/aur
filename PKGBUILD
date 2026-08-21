# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.8.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-coincurve: for CoinCurveECCBackend support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base/-/_}-${pkgver}.tar.gz)
sha512sums=('eaad3848b841b1a971efd6eaeb6356be74265d301996028d35f7b0d390e7417f9ba2eafaa916d1500203760469ca63baf5cfcc44a9e997f3ac2b1ee5b46132e8')

build() {
  cd ${_base/-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
