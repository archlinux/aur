# Maintainer: sudacode <suda@sudacode.com>

pkgname=python-jimaku-dl
_pkgname=jimaku-dl
pkgver=0.1.2
pkgrel=1
pkgdesc="A Python package to download Japanese subtitles for anime from Jimaku.cc"
arch=('any')
url="https://github.com/ksyasuda/jimaku-dl"
license=('GPL3')
depends=('python' 'fzf')
optdepends=('mpv: for playback functionality')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50283abb662c03a9e1956355d4f900d562a7751df74bccf1315feaa38ad4e9f0')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"
	pytest -o addopts=""
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
