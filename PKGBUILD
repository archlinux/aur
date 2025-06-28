# Maintainer: nazdridoy <nazdridoy399@gmail.com>
pkgname=ngpt
pkgver=4.0.2
pkgrel=1
pkgdesc="A Swiss army knife for LLMs: A fast, lightweight CLI and interactive chat tool that brings the power of any OpenAI-compatible LLMs straight to your terminal. rewrite texts or refine code, craft git commit messages, generate and run OS-aware shell commands"
arch=('any')
url="https://github.com/nazdridoy/ngpt"
license=('MIT')
depends=('python' 'python-requests>=2.31.0' 'python-rich>=10.0.0' 'python-prompt_toolkit>=3.0.0' 'python-pyperclip>=1.8.0' 'python-beautifulsoup4>=4.12.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nazdridoy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('02d9ac579428289fd9c07026dbe20740d26c083f38c9bb7ed46d413680d7466a')

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
