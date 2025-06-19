# Maintainer: envolution
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
# shellcheck shell=bash disable=SC2034,SC2154
_base=textual-dev
pkgname=python-${_base}
pkgdesc="Development tools for working with Textual"
pkgver=1.7.0
pkgrel=1
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-textual python-textual-serve python-aiohttp python-click python-msgpack python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a3c2e14a3305620bfedc5a3d5f39844b107881ac2cbd39657f9e60f442e4dafbb8da5cb9d605e7033c1ad5e1766ae5a0c8de5c95127cc90ae4ded19dcc5cc2a3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPATH=$PWD/src python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  #PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
