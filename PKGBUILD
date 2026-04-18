# Maintainer: Kai <kaimingzhang1234@gmail.com>
pkgname=cheetahclaws-git
pkgver=r439.2998f79
pkgrel=1
pkgdesc="An extensible, Python-native agent system for autonomous multi-model workflows (Claude, GPT, Ollama, etc.)"
arch=('any')
url="https://github.com/SafeRL-Lab/cheetahclaws"
license=('MIT')
depends=(
  'python'
  'python-anthropic'
  'python-openai'
  'python-httpx'
  'python-rich'
  'python-pyte'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-sounddevice: voice input'
  'python-pillow: vision / OCR support'
  'python-prompt_toolkit: autosuggestions in the REPL'
  'python-playwright: browser automation tools'
  'python-pymupdf: PDF file support'
  'python-openpyxl: Excel file support'
  'python-pytesseract: OCR support'
  'python-yfinance: trading module'
  'python-sqlalchemy: web server backend'
  'python-passlib: web server auth'
  'python-pyjwt: web server JWT auth'
  'ollama: local model support'
)
provides=('cheetahclaws')
conflicts=('cheetahclaws')
source=("${pkgname}::git+https://github.com/SafeRL-Lab/cheetahclaws.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
