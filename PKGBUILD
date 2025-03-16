# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.4.7
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
	'python-pydantic'
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
b2sums=('d11cfd24f1fb4aeff9ebb61c304c45d4b6276bff8ac188ad53710a2b8883bce5fa7a28b8c53f370ae694e14ecf869c027a898d4edeb433e12804b6fac26f6f88')
