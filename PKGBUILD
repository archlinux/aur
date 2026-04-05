# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai
pkgver=0.5.18
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
  'litellm'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
  'python-fastapi: proxy server support'
  'uvicorn: proxy server support'
  'python-httpx: proxy server with HTTP/2'
  'python-openai: OpenAI API format support'
  'python-tree-sitter-language-pack: AST-based code compression'
)
source=("https://files.pythonhosted.org/packages/source/h/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('c8455f649b8a313ae6bf7bf5377564011b3a4123860c3c48954cf120dcf9b744')

build() {
  cd "${pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
