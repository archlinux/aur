# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=selectolax
pkgname=python-${_base}
pkgver=0.3.21
pkgrel=1
pkgdesc="Fast HTML5 parser with CSS selectors"
arch=(x86_64)
url="https://github.com/rushter/${_base}"
license=(MIT)
depends=(cython)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4c98141e8d50bc9778980d43bb3bada2af11cd9ece6cf1987f26129f27281b6e54b9999e5d55f900e937dcb440606c7e45ad61a15256ce46676000702dcfa564')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
