# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=zotero-mcp-server
_srcname=zotero-mcp
pkgver=0.4.1
pkgrel=1
pkgdesc="A Model Context Protocol server for Zotero"
arch=('any')
url='https://github.com/54yyyu/zotero-mcp'
license=('MIT')
depends=(
	'python'
	'python-bibtexparser'
	'python-dotenv'
	'python-jsonref'
	'python-fastmcp'
	'python-markitdown'
	'python-mcp'
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
sha256sums=('cc88ef75af89cf1048040565a75daa8e3184b81bf69b16154e99a06c501b1231')

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
