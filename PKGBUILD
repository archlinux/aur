# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>
_base=coincurve
pkgname=python-${_base}
pkgver=19.0.0
pkgrel=1
pkgdesc="Cross-platform Python CFFI bindings for libsecp256k1"
arch=(x86_64)
url="https://github.com/ofek/${_base}"
license=(Apache MIT)
depends=(python-asn1crypto python-cffi libsecp256k1)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('59917d3e961b561f44904aa0b09cb86d97933d0291b213929e6d4bc9a58f554b382facf7723cc6bfd58edf728aaf26cef72539509df679d26c8de1f1a769a0ad')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
