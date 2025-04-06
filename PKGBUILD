# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm-git
pkgver=0.10.0.r6.g1e9cae0
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=(
	'python'
	'python-ollama'
	'python-rich'
	'python-typer'
	'python-textual'
	'python-pyperclip'
	'python-aiosqlite'
	'python-aiosql'
	'python-packaging'
	'python-dotenv'
	'python-linkify-it-py'
	'python-rich-pixels'
	'python-pillow'
	'python-textualeffects'
	'python-pydantic'
	'python-mcp'
	'python-textual-image'
)
makedepends=(
	'python-installer'
	'git'
	'uv'
)
b2sums=('SKIP')

source=("$pkgname::git+https://github.com/ggozad/oterm.git")

pkgver() {
	cd "$pkgname" || exit
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname" || exit
	uvx --from build pyproject-build --installer uv
}

package() {
	cd "$pkgname" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
