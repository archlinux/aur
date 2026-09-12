# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=zotero-mcp-server
_srcname=zotero-mcp
pkgver=0.11.0
pkgrel=1
pkgdesc="A Model Context Protocol server for Zotero"
arch=('any')
url='https://github.com/54yyyu/zotero-mcp'
license=('MIT')
depends=(
	'python'
	'python-bibtexparser'
	'python-dotenv'
	'python-fastmcp-slim>=2.14.0'
	'python-fastmcp-slim<4'
	'python-httpx'
	'python-markdownify'
	'python-pdf-inspector>=0.2.6'
	'python-pydantic'
	'python-pyzotero'
	'python-requests'
	'python-unidecode'
)
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'zotero: local Zotero desktop library access'
	'python-chromadb: semantic search vector database support'
	'python-sentence-transformers: local semantic embeddings'
	'python-openai: OpenAI semantic embeddings'
	'python-google-genai: Gemini semantic embeddings'
	'python-tiktoken: semantic search token counting'
	'python-pymupdf: PDF outline extraction'
	'python-ebooklib: EPUB annotation support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0c30850c023d4f978c54a17e0e82cc7b3f1fec54828892b19f82afc64bdc3dc')

build() {
	cd "$_srcname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 docs/getting-started.md "$pkgdir/usr/share/doc/$pkgname/getting-started.md"
}
