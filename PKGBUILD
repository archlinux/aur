# Maintainer: nazdridoy <nazdridoy399@gmail.com>
pkgname=ngpt
pkgver=3.8.0
pkgrel=1
pkgdesc="Swiss army knife for LLMs: powerful CLI and interactive chatbot in one package. Seamlessly work with OpenAI, Ollama, Groq, Claude, Gemini, or any OpenAI-compatible API to generate code, craft git commits, rewrite text, and execute shell commands."
arch=('any')
url="https://github.com/nazdridoy/ngpt"
license=('MIT')
depends=('python' 'python-requests>=2.31.0' 'python-rich>=10.0.0' 'python-prompt_toolkit>=3.0.0' 'python-pyperclip>=1.8.0' 'python-beautifulsoup4>=4.12.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nazdridoy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9b5d4725dddccdc843115693db365871778372e8ec0b2cb3a0fc543cb6d26b31')

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
