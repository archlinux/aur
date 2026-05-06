# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoParser
pkgname=python-${_base,,}
pkgver=1.2.0
pkgrel=1
pkgdesc="Cryptographic protocol parser"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-cryptodatahub)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('8100349a6904a947df8841b6ca2390cdaf5e69b7979a462f17c1daa9b16cf8e7dc729ca0c452a44af54e3103bfe4c94dd0a9cf58ed516fb43e190870cff65059')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
