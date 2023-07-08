# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>
_base=coincurve
pkgname=python-${_base}
pkgver=18.0.0
pkgrel=1
pkgdesc="Cross-platform Python CFFI bindings for libsecp256k1"
arch=(x86_64)
url="https://github.com/ofek/${_base}"
license=(Apache MIT)
depends=(python-asn1crypto python-cffi libsecp256k1)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9cd9b333c456f0e7a4edd300279442e638f2ba3e518c096ee7bd1838dc14ec3886a818438c08f8649946b20951aa54480d8d3ed6b49c3cb66f6a93d5110a396b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
