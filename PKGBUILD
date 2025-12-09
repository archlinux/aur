# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=selectolax
pkgname=python-${_base}
pkgver=0.4.6
pkgrel=1
pkgdesc="Fast HTML5 parser with CSS selectors"
arch=(x86_64)
url="https://github.com/rushter/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ceba2d1183244f9d1b7c82a7e86c297d1a4e71ac47560ca03522b24be513591323125531bf91912e37b9cdfb2807e3159f3e16ebde8e7616e1b1a951e99984ed')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
