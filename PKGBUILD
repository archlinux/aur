# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>
_base=algopy
pkgname=python-${_base}
pkgdesc="A library for Automatic Differentation in Python"
pkgver=0.7.2
pkgrel=1
arch=(any)
url="https://pythonhosted.org/${_base}"
license=('custom')
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4968c3dd0726a552896250e758cce6b3be468bf0248c8a00834f59dffdaae6f3914b465a9b8f2f7d4a372346d131ad7caa19e20b1d11275cbd4703a29a94364d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
