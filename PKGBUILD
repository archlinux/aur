# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eciespy
pkgname=python-${_base}
pkgver=0.4.5
pkgrel=1
pkgdesc="Elliptic Curve Integrated Encryption Scheme for secp256k1 in Python"
arch=(any)
url="https://github.com/${_base/sp/s\/p}"
license=(MIT)
depends=(python-coincurve python-eth-keys)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ffbf96bfb71d0da4a26f60c3fa0bddd2c3022f068ae807bc5b28eade863de8c52b2087ae135df5eee856963d93078c02e7e801c35e05ae142959100820029a88')

build() {
  cd py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
