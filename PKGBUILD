pkgname=deezer-downloader
pkgver=2.11.0
pkgrel=3
arch=('x86_64')
url='https://github.com/kmille/deezer-downloader'
license=('MIT')
depends=('python' 'python-waitress' 'yt-dlp' 'python-giphypop' 'python-flask_autoindex' 'python-future' 'python-mpd2' 'python-blinker' 'python-certifi' 'python-click' 'python-iniconfig' 'python-pyotp' 'python-importlib-metadata' 'python-tomli' 'python-urllib3' 'python-magic')
makedepends=('poetry' 'git')
pkgdesc="Download music from Deezer and Spotify with a simple web frontend, through a local-hosted service written in Python"
source=("git+https://github.com/kmille/deezer-downloader#tag=v$pkgver")
sha256sums=('9692a505cf1e58dbc554b8036c1079d76ed95f267b9b381f89d30a34c7cb6263')
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

