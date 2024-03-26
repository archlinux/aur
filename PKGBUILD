# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama-git
pkgver=0.1.7.r0.gfcdf577
pkgrel=1
pkgdesc="Ollama Python library"
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/ollama/ollama-python"
license=('MIT')
depends=(
	'ollama'
	'python'
	'python-httpx'
	'python-typing_extensions'
)
makedepends=(
	'python-poetry'
	'git'
)
b2sums=('SKIP')

source=("$pkgname::git+https://github.com/ollama/ollama-python.git")

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	poetry build -f wheel
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
