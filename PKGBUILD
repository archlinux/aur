# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoParser
pkgname=python-${_base,,}
pkgver=0.12.3
pkgrel=1
pkgdesc="Cryptographic protocol parser"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL2)
depends=(python-cryptodatahub python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('b0d3200b4a706c51e354568547d2380d5ba2a914de2e1bd158d2c82c7c3c34598cb67c6e7d8199d838aeb0c698809e4183bfc390c5ee5902298f42f5e41433f9')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
