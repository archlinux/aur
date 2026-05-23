# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=docmancer
pkgname=$_pkgname-git
pkgver=r117.7f85a58
pkgrel=1
pkgdesc="Fetch docs, embed locally, expose to AI agents via skills"
arch=('any')
url="https://github.com/docmancer/docmancer"
license=('MIT')
depends=(
  'python>=3.11'
  'python-pydantic'
  'python-pydantic-settings'
  'python-qdrant-client'
  'python-fastembed'
  'python-httpx'
  'python-click'
  'python-yaml'
  'python-filelock'
  'python-trafilatura'
  'python-markdownify'
  'python-w3lib'
  'python-ultimate-sitemap-parser'
  'python-beautifulsoup4'
  'python-jsonschema'
  'python-mcp'
)
optdepends=(
  'python-playwright: browser extraction'
  'python-datasets: benchmark datasets'
  'python-openai: OpenAI benchmark provider'
  'python-anthropic: Anthropic benchmark provider'
  'python-google-genai: Gemini benchmark provider'
)
makedepends=('git' 'python-build' 'python-installer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/docmancer/docmancer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
