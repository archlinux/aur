# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=CryptoParser
pkgname=python-${_base,,}
pkgver=0.12.6
pkgrel=1
pkgdesc="Cryptographic protocol parser"
arch=(any)
url="https://gitlab.com/coroner/${_base}"
license=(MPL-2.0)
depends=(python-cryptodatahub python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://gitlab.com/coroner/${_base}/-/archive/v${pkgver}/${_base,,}-v${pkgver}.tar.gz)
sha512sums=('76002fb70347c401510efb39386ee84aabe06b024445ee12c79b8987d31f4acf65b221f17c5c399951edbf252cdc721b02d7d1677fb70d9e61d2f3f1337fbaf7')

build() {
  cd ${_base,,}-v${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base,,}-v${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
