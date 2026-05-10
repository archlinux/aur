# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.17.1
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
b2sums=('c01d1fcc0f54d34bd5c78713b5e2837e86980d4884dd2d82dd5e003a36eae5d0c71e526e8f2a829fbf9148ab4927d19f786bef8021cb8d4e0ae626644af24936')

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
