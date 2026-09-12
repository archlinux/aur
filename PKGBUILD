# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=arxiv-mcp-server
pkgver=0.7.2
pkgrel=1
pkgdesc='A flexible arXiv search and analysis service with MCP protocol support'
arch=('any')
url='https://github.com/blazickjp/arxiv-mcp-server'
license=('Apache-2.0')
depends=(
	'python>=3.11'
	'python-aiofiles>=23.2.1'
	'python-aiohttp>=3.9.1'
	'python-anyio>=4.2.0'
	'python-arxiv>=2.1.0'
	'python-httpx>=0.24.0'
	'python-mcp>=1.27.0'
	'python-mcp<2.0.0'
	'python-pydantic>=2.8.0'
	'python-pydantic-settings>=2.1.0'
	'python-dateutil>=2.8.2'
	'python-dotenv>=1.0.0'
	'python-sse-starlette>=1.8.2'
	'python-starlette>=0.27.0'
	'uvicorn>=0.30.0'
)
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'python-aioresponses>=0.7.6'
	'python-pytest>=8.0.0'
	'python-pytest-asyncio>=0.23.5'
	'python-pytest-cov>=4.1.0'
	'python-pytest-mock>=3.10.0'
)
optdepends=(
	'python-pymupdf4llm: PDF processing support'
	'python-pymupdf-layout: PDF layout analysis support'
	'python-numpy: pro semantic search support'
	'python-sentence-transformers: pro semantic search support'
)
_pypiname=arxiv_mcp_server
source=("https://files.pythonhosted.org/packages/source/a/${pkgname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('024c8122112617af9eea9d913a6c46ec5cf1d6b5fbcbac43c8ba0615bfe9d65c')

build() {
	cd "${_pypiname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pypiname}-${pkgver}"
	PYTHONPATH="$PWD/src" pytest
}

package() {
	cd "${_pypiname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
