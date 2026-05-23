# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.18.0
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')

depends=(
	'python'
	'python-httpx'
	'python-ollama'
	'python-rich'
	'python-rich-pixels'
	'python-typer'
	'python-textual'
	'python-textual-image'
	'python-textualeffects'
	'python-pydantic-ai-slim'
	'python-exceptiongroup'
	'python-pyperclip'
	'python-aiosqlite'
	'python-aiosql'
	'python-jsonref'
	'python-packaging'
	'python-dotenv'
	'python-linkify-it-py'
	'python-pillow'
	'python-pydantic'
	'python-mcp'
	'python-fastmcp'
	'python-cohere'
	'python-mistralai'
	'python-anthropic'
	'python-google-genai'
)

makedepends=(
	'python-wheel'
	'python-build'
	'python-installer'
	'python-hatchling'
	'python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ggozad/oterm/archive/refs/tags/$pkgver.tar.gz")
b2sums=('7d603716f2ccc6f0e27b45397099cb5e93e52bd49744616b86d661613b0d0702396e6170d10b572a26ab4b6914fad0c33a7aa41bfd9eb0891af48d1a8f2ff8db')

build() {
	cd "$pkgname-$pkgver" || exit

	uvx --from build pyproject-build --installer uv
}

package() {
	cd "$pkgname-$pkgver" || exit

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
