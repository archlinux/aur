# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-yark
pkgver=1.2.9
pkgrel=1
pkgdesc="YouTube archiving made simple"
arch=('any')
url="https://github.com/Owez/yark"
license=('MIT')
depends=('python' 'python-colorama' 'python-flask' 'python-progress' 'python-requests' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c9c5b77472c28a70bb3478088a3c3feeaf72b0b099ff4860c64a7b99ec1e163')

build() {
	cd "yark-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "yark-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
