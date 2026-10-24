# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoParser
pkgname=python-${_base,,}
pkgver=1.6.1
pkgrel=1
pkgdesc="Cryptographic protocol parser"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-cryptodatahub)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('a296c83fb2dc14003f82ae1331e1d1913910d7607ec86f76996201d2f6a077ba28093d7914e65632265c1bc32cfdd3e513d1d81596c1e677159f4a841df3c274')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
