# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=selectolax
pkgname=python-${_base}
pkgver=0.3.34
pkgrel=1
pkgdesc="Fast HTML5 parser with CSS selectors"
arch=(x86_64)
url="https://github.com/rushter/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c5e96be1bb405f82fc8e3e58d349f33b2e7f49ba1a9761e08e20afbeb66b579cd236943a878039a7a6b1d527de7610da3e98f2c6faaca00d2b958ed2fd2c06d2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
