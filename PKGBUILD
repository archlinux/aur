# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai
pkgver=0.20.15
pkgrel=1
pkgdesc="Context optimization layer for LLM applications - cut token costs by 50-90%"
arch=('any')
url="https://github.com/chopratejas/headroom"
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-tiktoken'
  'python-pydantic'
  'python-click'
  'python-rich'
  'python-opentelemetry-api'
  'ast-grep'
  'litellm'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
  'python-fastapi: proxy server support'
  'uvicorn: proxy server support'
  'python-httpx: proxy server with HTTP/2'
  'python-openai: OpenAI API format support'
  'python-tree-sitter-language-pack: AST-based code compression'
  'python-numpy: relevance scoring, evals, and memory adapters'
  'python-datasets: evaluation and voice training datasets'
  'python-huggingface-hub: Kompress model downloads'
)
source=("https://files.pythonhosted.org/packages/source/h/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('569468c62a7329a1abefd496a6d595544c26b46e9b2bffd80916d04d33530cc0')

build() {
  cd "${pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
