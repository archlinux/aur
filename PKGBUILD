# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.17.2
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
b2sums=('7127dfb8ca4a9e4713ed5ff8a39c212582b741e2a1f14d07ef6274faa16a9ac1e9130c19d02f34f8fef7816f853a6e5a1479c5f95ad77eb853b862da81fd59ea')

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
