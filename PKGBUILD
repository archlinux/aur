# Maintainer: sudacode <suda@sudacode.com>

pkgname=python-jimaku-dl
_pkgname=jimaku-dl
pkgver=0.1.6
pkgrel=1
pkgdesc="A Python package to download Japanese subtitles for anime from Jimaku.cc"
arch=('any')
url="https://github.com/ksyasuda/jimaku-dl"
license=('GPL3')
depends=('python' 'fzf' 'python-ffsubsync')
optdepends=('mpv: for playback functionality' 'python-ffsubsync: for syncing subtitles')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad1dbd1ac921451a7a7fd3283c0d2deb2ef6b94092a5c03df3670984708c73ee')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
