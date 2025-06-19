# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
_base=textual-serve
pkgname=python-${_base}
pkgdesc="Development tools for working with Textual"
pkgver=1.1.2
pkgrel=1
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-textual python-rich python-jinja python-aiohttp-jinja2 python-aiohttp)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d933cdd5aca3fe1e4f3bc8b5156b1f75d0ce3107184422fcd110a1bd9f4d0163e4f40e09452ae55dd688f5d3f14ef58425d46232a6dfea01bce27759995a9cf6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  #PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
