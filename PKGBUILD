# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=eth-keys
pkgname=python-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=(any)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python-coincurve python-eth-utils python-eth-typing)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('02df2202cc3c03a454aa517f68e6db325f5e21c7019fb7e22c9e3b4d866ebfa591755a5143f48a721ac00367fbc9502bcd864a370d06d80e770983fdcc77acdc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
