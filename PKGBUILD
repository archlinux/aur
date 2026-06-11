# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=graphify
_name=graphifyy
pkgver=0.8.37
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder of code, docs, papers, images, or videos into a queryable knowledge graph"
arch=('any')
url="https://github.com/safishamsi/graphify"
license=('MIT')

depends=(
    'python'
    'python-networkx'
    'python-numpy'
    'python-rapidfuzz'
    'python-tree-sitter>=0.23.0'
    'python-tree-sitter-python'
    'python-tree-sitter-javascript'
    'python-tree-sitter-typescript'
    'python-tree-sitter-go'
    'python-tree-sitter-rust'
    'python-tree-sitter-java'
    'python-tree-sitter-groovy'
    'python-tree-sitter-c'
    'python-tree-sitter-cpp'
    'python-tree-sitter-dm'
    'python-tree-sitter-ruby'
    'python-tree-sitter-c-sharp'
    'python-tree-sitter-kotlin'
    'python-tree-sitter-scala'
    'python-tree-sitter-php'
    'python-tree-sitter-swift'
    'python-tree-sitter-lua'
    'python-tree-sitter-zig'
    'python-tree-sitter-powershell'
    'python-tree-sitter-elixir'
    'python-tree-sitter-objc'
    'python-tree-sitter-julia'
    'python-tree-sitter-verilog'
    'python-tree-sitter-fortran'
    'python-tree-sitter-bash'
    'python-tree-sitter-json'
)

optdepends=(
    'python-mcp: Model Context Protocol (MCP) server'
    'python-neo4j: Neo4j export support'
    'python-pypdf: PDF extraction support'
    'python-markdownify: PDF/HTML extraction support'
    'python-watchdog: File watching support'
    'python-matplotlib: SVG output support'
    'python-graspologic: Leiden community detection support (Python < 3.13)'
    'python-docx: Office document (.docx) support'
    'python-openpyxl: Office spreadsheet (.xlsx) support'
    'python-faster-whisper: Video transcription support'
    'yt-dlp: Video download support'
    'python-openai: OpenAI-compatible LLM backends (Kimi/Ollama/Gemini/OpenAI)'
    'python-tiktoken: Token counting for Kimi/Gemini/OpenAI backends'
    'python-anthropic: Claude direct extraction backend'
    'python-boto3: AWS Bedrock LLM backend'
    'python-tree-sitter-sql: SQL indexing support'
    'python-jieba: Chinese text segmentation for the MCP search server'
    'python-psycopg: PostgreSQL schema introspection backend'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

provides=("${_name}")
conflicts=("${_name}")

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e470d73d87f5fd4124f8c71dc86b1c43703686eaa5df4641dd217a2e1e88b751')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
