# Maintainer: sudacode <suda@sudacode.com>

pkgname=python-jimaku-dl
_pkgname=jimaku-dl
pkgver=0.1.3
pkgrel=2
pkgdesc="A Python package to download Japanese subtitles for anime from Jimaku.cc"
arch=('any')
url="https://github.com/ksyasuda/jimaku-dl"
license=('GPL3')
depends=('python' 'fzf')
optdepends=('mpv: for playback functionality' 'python-ffsubsync: for syncing subtitles')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2069b41ad66870022064e51b8eabfb3f720636fe3a401c6fa7be16f556e3c62c')

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
