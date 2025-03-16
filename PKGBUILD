# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>
_base=coincurve
pkgname=python-${_base}
pkgver=21.0.0
pkgrel=2
pkgdesc="Cross-platform Python CFFI bindings for libsecp256k1"
arch=(x86_64)
url="https://github.com/ofek/${_base}"
license=(Apache-2.0 MIT)
depends=(python libsecp256k1)
makedepends=(python-build python-installer python-hatchling python-wheel python-scikit-build-core python-cffi)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('19f8ab584513653cb0b05d08db8abf86b7bab34878f047423c0217ffb996e757dc1ab37dbb194cf5eada42853cd622cabb181ff6cbb4c50b550bb189a8651f42')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
