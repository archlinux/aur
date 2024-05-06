# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Static image export for web-based visualization libraries with zero dependencies"
arch=(x86_64 aarch64)
url="https://github.com/plotly/${_base}"
options=(!strip)
license=(MIT)
depends=(python-plotly sqlite)
makedepends=(python-installer)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(${url}/releases/download/v${pkgver}/${_base,,}-${pkgver}-py2.py3-none-manylinux1_x86_64.whl)
source_aarch64=(${url}/releases/download/v${pkgver}/${_base,,}-${pkgver}-py2.py3-none-manylinux2014_aarch64.whl)
sha256sums_x86_64=('aa21cf1bf1c78f8fa50a9f7d45e1003c387bd3d6fe0a767cfbbf344b95bdc3a8')
sha256sums_aarch64=('845819844c8082c9469d9c17e42621fbf85c2b237ef8a86ec8a8527f98b6512a')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
  install -Dm 644 ${_base,,}/executable/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base,,}/executable/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
