# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
_base=algopy
pkgname=python-${_base}
pkgdesc="A library for Automatic Differentation in Python"
pkgver=0.6.1
pkgrel=1
arch=(any)
url="https://pythonhosted.org/${_base}"
license=('custom')
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('52101dca9473ff91297fe7e070b1906e3fe72c654b18941e425f0b1712ca78dd9583e5ecd2f5da59ee4d93b511fa20c515f3d53c8402bdf58dbbe294f274f952')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
