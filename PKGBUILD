# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eciespy
pkgname=python-${_base}
pkgver=0.4.2
pkgrel=1
pkgdesc="Elliptic Curve Integrated Encryption Scheme for secp256k1 in Python"
arch=(any)
url="https://github.com/${_base/sp/s\/p}"
license=(MIT)
depends=(python-coincurve python-eth-keys)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9baf19a526296ccf6b5452c20dc21f1883697a991c4ea0e72615ff1b5b4a9693b98b6c0288add709302a1669684b7f3dba3bfaf42a266de871cc9f6427684386')

build() {
  cd py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
