# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eciespy
pkgname=python-${_base}
pkgver=0.4.4
pkgrel=1
pkgdesc="Elliptic Curve Integrated Encryption Scheme for secp256k1 in Python"
arch=(any)
url="https://github.com/${_base/sp/s\/p}"
license=(MIT)
depends=(python-coincurve python-eth-keys)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('470764aa5e5053fdf00c46341ab07f0593220ec8d89779ad2e861b0223d19e95efc66a6546ea1d02aec9830f71f2b320de8b199a31c2ceac14bb63885501f581')

build() {
  cd py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
