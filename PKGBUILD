# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eciespy
pkgname=python-${_base}
pkgver=0.4.3
pkgrel=1
pkgdesc="Elliptic Curve Integrated Encryption Scheme for secp256k1 in Python"
arch=(any)
url="https://github.com/${_base/sp/s\/p}"
license=(MIT)
depends=(python-coincurve python-eth-keys)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('35e5e4b78d88b381a51b6f181f931ee91059cd6dd0af2500cc14504055b997cb91603ee3b79d97579fc2776f93c6b2c10d33d2d2553120912c548967b45c9976')

build() {
  cd py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
