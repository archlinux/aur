# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=selectolax
pkgname=python-${_base}
pkgver=0.3.18
pkgrel=1
pkgdesc="Fast HTML5 parser with CSS selectors"
arch=(x86_64)
url="https://github.com/rushter/${_base}"
license=(MIT)
depends=(cython)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6c81c3171aab8be75803affd6ef06ead6d001f783f466d19f0f68320f32d66a78efaf08164391b28f27c6e40a274afe8fb3b57c6ff4183dd5c1bc2a8892e0ce3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
