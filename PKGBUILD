# Maintainer: envolution
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
# shellcheck shell=bash disable=SC2034,SC2154
_base=textual-dev
pkgname=python-${_base}
pkgdesc="Development tools for working with Textual"
pkgver=1.8.0
pkgrel=2
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-textual python-textual-serve python-aiohttp python-click python-msgpack python-typing_extensions)
makedepends=(python-build python-hatchling python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e508922362cc2bd5f7bc275e80cd1bbed74516caa13a5aa1a3f236067a735f3c7d3ab168d4587348a57db6b6845ac1d9bd23b2f3e17d43c96d8b190e3950bc75')

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
