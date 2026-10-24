# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=selectolax
pkgname=python-${_base}
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast HTML5 parser with CSS selectors"
arch=(x86_64)
url="https://github.com/rushter/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools cython python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('576c28fdc085ff80c1934089791e91d5505300b840bc49300b50cad2f31410e4fbf82a342314cf88e89e9af5b770f40664aca65683bddb0d370ed1d9f8a4e832')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
