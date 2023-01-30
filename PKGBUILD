# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openant
pkgname=python-${_base,,}
pkgdesc="ANT, ANT-FS and ANT+ Python Library"
pkgver=1.2.0
pkgrel=1
arch=(any)
url="https://github.com/Tigge/${_base}"
license=(MIT)
depends=(python-pyusb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('baaa6c83614e5cbdf4d34e0a6bd3f12470f201edfa80944d1b71be09c166baa1594c3333c97cac4b441a23500331b127d34a1303d7ed5d6f9e1f33cb9325dea2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
