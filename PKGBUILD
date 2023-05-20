# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>
_base=coincurve
pkgname=python-${_base}
pkgver=17.0.0
pkgrel=2
pkgdesc="Cross-platform Python CFFI bindings for libsecp256k1"
arch=(x86_64)
url="https://github.com/ofek/${_base}"
license=(Apache MIT)
depends=(python-asn1crypto python-cffi libsecp256k1)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('15bc998469a243bc1f6d0f9308061c64b7000727f662827da57a82e23739bc7a3dce0c8b3d33d1a3daeadbba2759d5726b792726daf9d4d5e842e53a28855954')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
