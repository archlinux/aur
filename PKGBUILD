# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-click-to-mcp
pkgver=0.5.0
pkgrel=1
pkgdesc="Auto-wrap any Click or Typer CLI as an MCP server (stdio, HTTP+SSE, Streamable HTTP)"
arch=('any')
url="https://github.com/Coding-Dev-Tools/click-to-mcp"
license=('Apache-2.0')
depends=('python' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-starlette' 'python-sse-starlette' 'uvicorn')
optdepends=('python-starlette: HTTP+SSE and Streamable HTTP transports' 'python-sse-starlette: HTTP+SSE and Streamable HTTP transports' 'uvicorn: HTTP+SSE and Streamable HTTP transports')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14dfa3fc743cfd40451d91b87bbc0a5c354dca352e9454c409efb44f5a693c28')

build() {
	cd "click-to-mcp-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "click-to-mcp-$pkgver"
	python -m pytest tests -v --ignore=tests/test_http_transport.py --ignore=tests/test_streamable_http.py
}

package() {
	cd "click-to-mcp-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
