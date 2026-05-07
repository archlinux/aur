# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
_base=textual-web
pkgname=python-${_base}
pkgdesc="Run TUIs and terminals in your browser"
pkgver=0.7.0
pkgrel=1
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-uvloop python-click python-tomli python python-aiohttp python-typing_extensions python-importlib-metadata python-rich python-httpx python-msgpack python-pydantic python-textual python-pyxdg)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('31a718f87dd74b9737a9c9f305cc66118d124d18348b4cc59988700c453b2ffeaa7760809d3025aec7892a741a2ccbcafb23a1e19c60b1384ac2480700114efe')

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
