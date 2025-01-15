# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.4.6
pkgrel=1
pkgdesc="Ollama Python library"
arch=('any')
url="https://github.com/ollama/ollama-python"
license=('MIT')
depends=(
	'ollama'
	'python'
	'python-httpx'
	'python-typing_extensions'
)
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ollama/ollama-python/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "ollama-python-$pkgver" || exit
	# Remove poetry plugin dependencies
	sed -i '16,17d' pyproject.toml
	poetry build -f wheel
}

package() {
	cd "ollama-python-$pkgver" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('4e46c0123181dbbab25a223f9895238c4d44bf6bc0a594cee40ac1b69a976a09303c7084d2178ea1ee09937d762b671bd830d34453f913e6891c0ae18e997d92')
