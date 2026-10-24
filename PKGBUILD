# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eciespy
pkgname=python-${_base}
pkgver=0.4.7
pkgrel=1
pkgdesc="Elliptic Curve Integrated Encryption Scheme for secp256k1 in Python"
arch=(any)
url="https://github.com/${_base/sp/s\/p}"
license=(MIT)
depends=(python-coincurve python-eth-keys)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('953ea57946f65e2be8072a21b5a1787bb79b9efa9a26d5c35a592543b1d0fd29255e377dbcb8db38b0a40a9dc773f3b8bc951ea2a3c59e003a9c0e0dd348f54e')

build() {
  cd py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
