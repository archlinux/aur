# Maintainer: Your Name <your.email@example.com>

pkgname=graphify
_name=graphifyy
pkgver=0.5.0
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder of code, docs, papers, images, or videos into a queryable knowledge graph"
arch=('any')
url="https://github.com/safishamsi/graphify"
license=('MIT')

depends=(
    'python>=3.10'
    'python-networkx'
    'python-tree-sitter>=0.23.0'
    'python-tree-sitter-python'
    'python-tree-sitter-javascript'
    'python-tree-sitter-typescript'
    'python-tree-sitter-go'
    'python-tree-sitter-rust'
    'python-tree-sitter-java'
    'python-tree-sitter-c'
    'python-tree-sitter-cpp'
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
)

optdepends=(
    'python-mcp: Model Context Protocol (MCP) support'
    'python-neo4j: Neo4j export support'
    'python-pypdf: PDF extraction support'
    'python-html2text: PDF/HTML extraction support'
    'python-watchdog: File watching support'
    'python-matplotlib: SVG output support'
    'python-graspologic: Leiden community detection support (Python < 3.13)'
    'python-docx: Office document support'
    'python-openpyxl: Office document support'
    'python-faster-whisper: Video transcription support'
    'yt-dlp: Video download support'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

provides=("${_name}")
conflicts=("${_name}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/safishamsi/graphify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6383f17d1f23d653d15bc22ad638b3f263ab4f8d91cc656dc36e31c9fb9a48c9')

build() {
    cd "${pkgname}-${pkgver}"
    
    # Remove the strict <3.14 python version bound for Arch Linux
    sed -i 's/<3.14//g' pyproject.toml
    
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
