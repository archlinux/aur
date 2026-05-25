# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=4.4.7
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('any')
url="https://gitlab.com/zehkira/monophony"
license=('0BSD')
groups=()
depends=(
	'deno'
	'libadwaita'
	'python-brotli'
	'python-gobject'
	'python-logboth'
	'python-mprisify'
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
	'python-setuptools'
	'python-wheel'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('25385a84fd7bde2a5321d80f43f7cfe7d7388e3c2630bb58b7a8db4052bec395')

prepare() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	sed -i "/pip3 install/d" Makefile
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
