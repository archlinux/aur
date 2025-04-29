# Maintainer: nazdridoy <nazdridoy399@gmail.com>
pkgname=ngpt
pkgver=3.0.6
pkgrel=1
pkgdesc="Swiss army knife for LLMs: powerful CLI, interactive chatbot, and flexible Python library. Works with OpenAI, Ollama, Groq, Claude, Gemini, and any OpenAI-compatible API."
arch=('any')
url="https://github.com/nazdridoy/ngpt"
license=('MIT')
depends=('python' 'python-requests>=2.31.0' 'python-rich>=10.0.0' 'python-prompt_toolkit>=3.0.0' 'python-pyperclip>=1.8.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nazdridoy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ebb47106803b74bf9c50b544a6948fff9ce6d464ba4cf590ba8145db91abc0bd')

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
