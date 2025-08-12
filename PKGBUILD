# Maintainer: nazdridoy <nazdridoy399@gmail.com>
pkgname=ngpt
pkgver=6.7.2
pkgrel=1
pkgdesc="A lightning-fast AI-powered CLI toolkit for terminal productivity. Generate code, craft git commits, execute shell commands, and chat with any OpenAI-compatible LLM (OpenAI, Ollama, Groq, Claude, Gemini) directly from your terminal."
arch=('any')
url="https://github.com/nazdridoy/ngpt"
license=('MIT')
depends=('python' 'python-requests>=2.31.0' 'python-rich>=10.0.0' 'python-prompt_toolkit>=3.0.0' 'python-pyperclip>=1.8.0' 'python-beautifulsoup4>=4.12.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nazdridoy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4fb61e60f198fcea4ed5b1f25a075d118d8060f099febfa1aaa0dd06bd23758a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
