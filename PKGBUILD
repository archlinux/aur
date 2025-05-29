# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown-mcp
_pkgname=${pkgname#python-}
pkgver=0.0.1a4
pkgrel=1
pkgdesc="MCP server for the Markitdown library"
arch=(any)
url="https://github.com/microsoft/markitdown"
license=(MIT)
depends=(
  python
  python-markitdown
  python-starlette
  uvicorn
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatch
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/markitdown-mcp/markitdown_mcp-$pkgver.tar.gz"
  LICENSE)
sha256sums=('309c94dc883311e6909d849382a6c7bc402dfb2692dab448c136c6864c6bf49e'
            'c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')

_pkgdir='markitdown_mcp'
build() {
  cd "$_pkgdir-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgdir-$pkgver"
  #  python -m pytest # no test files yet
}

package() {
  cd "$_pkgdir-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
