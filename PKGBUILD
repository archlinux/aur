# Maintainer: sudacode <suda@sudacode.com>

pkgname=python-jimaku-dl
_pkgname=jimaku-dl
pkgver=0.1.1
pkgrel=1
pkgdesc="A Python package to download Japanese subtitles for anime from Jimaku.cc"
arch=('any')
url="https://github.com/ksyasuda/jimaku-dl"
license=('GPL3')
depends=('python' 'fzf')
optdepends=('mpv: for playback functionality')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2db463d510e2081e205e55ed98603b8aade2c0bf5c6ab7431be67fbd1ae48b6')

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
