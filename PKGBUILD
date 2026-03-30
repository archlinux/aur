pkgname=deezer-downloader
pkgver=2.12.0
pkgrel=7
arch=('x86_64')
url='https://github.com/kmille/deezer-downloader'
license=('MIT')
depends=('python>=3.14' 'python-waitress' 'yt-dlp' 'python-giphypop' 'python-flask_autoindex' 'python-mpd2' 'python-blinker' 'python-certifi' 'python-click' 'python-iniconfig' 'python-pyotp' 'python-importlib-metadata' 'python-tomli' 'python-urllib3' 'python-magic' 'python-pycryptodome' 'python-mutagen')
makedepends=('poetry' 'git')
pkgdesc="Download music from Deezer and Spotify with a simple web frontend, through a local-hosted service written in Python"
source=("git+https://github.com/kmille/deezer-downloader#tag=v$pkgver")
sha256sums=('9fe58f108569b843664d97ab2e9cea6ff938d1e9bca8c41bb66d8f92bc689f7a')
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
	cp "$pkgdir/usr/lib/python3.14/site-packages/deezer_downloader/cli/deezer-downloader.ini.template" "$pkgdir/etc/config.ini"
}

