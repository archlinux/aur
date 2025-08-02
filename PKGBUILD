# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=3.4.0
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('any')
url="https://gitlab.com/zehkira/monophony"
license=('GPL-2.0-or-later')
groups=()
depends=(
	'libadwaita'
	'python-brotli'
	'python-gobject'
	'python-mpris_server'
	'python-mutagen'
	'python-pycryptodomex'
	'python-requests'
	'python-websockets'
	'python-ytmusicapi'
	'yt-dlp'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('afc31d75fcc73e0f037f665046ae71cb74046703d2d6b64590e162f2b06f87b5')

prepare() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	sed -i "/pip install/d" Makefile
}

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	python -m installer --destdir="$pkgdir" dist/*.whl
	make install prefix="$pkgdir/usr"
}
