# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.19.0
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
	'python-fastmcp-slim'
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
b2sums=('d875e17f031c1ebb9ea23150b6c7b25049d6371794885c39cf36daf174f2a404d08557b6a6435a1e17beb6dff4069847abc6d1b88e95125890699f3af26e4786')

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
