# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-tcxparser
pkgdesc="Simple parser for Garmin TCX files"
pkgver=2.4.0
pkgrel=1
arch=(any)
url="https://github.com/vkurup/${pkgname}"
license=(BSD-3-Clause)
depends=(python-lxml python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b5921a2987aedf20165600db541f60f21f221493047206e0bffb5ffe97c7c4ce4471efdf7d9e35993c4ca2ac7ad280f3a357a9a1e10f9089781fca4357147b94')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
