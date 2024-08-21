# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm-git
pkgver=0.4.2.r6.g4a61ba7
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
)
makedepends=(
	'python-installer'
	'git'
	'uv'
)
b2sums=('SKIP')

source=("$pkgname::git+https://github.com/ggozad/oterm.git")

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	uvx --from build pyproject-build --installer uv
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
