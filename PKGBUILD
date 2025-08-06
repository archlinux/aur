pkgname=deezer-downloader
pkgver=2.9.0
pkgrel=1
arch=('x86_64')
url='https://github.com/kmille/deezer-downloader'
license=('MIT')
depends=('python' 'python-waitress' 'yt-dlp' 'python-flask_autoindex' 'python-future' 'python-mpd2' 'python-blinker' 'python-certifi' 'python-click' 'python-iniconfig' 'python-importlib-metadata' 'python-tomli' 'python-urllib3' 'python-magic')
makedepends=('poetry' 'git')
pkgdesc="Download music from Deezer and Spotify with a simple web frontend, through a local-hosted service written in Python"
source=("git+https://github.com/kmille/deezer-downloader#tag=v$pkgver")
sha256sums=('f4a988ddaab96ff5643c760a7fb497b68d174db8c87e82d4f4ce81f5394c5acd')
install=setup.install
build() {
	cd $srcdir/$pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$pkgname/dist
	install -dm755 $srcdir/temp
	python -m installer --destdir="$pkgdir" *.whl
	install -dm755 $pkgdir/etc
	cp "$pkgdir/usr/lib/python3.13/site-packages/deezer_downloader/cli/deezer-downloader.ini.template" "$pkgdir/etc/config.ini"
}

