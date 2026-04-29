# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=spotdl
pkgver=4.4.4
pkgrel=1
pkgdesc='Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found).'
arch=('any')
url='https://github.com/spotDL/spotify-downloader'
# url='https://spotdl.readthedocs.io/en/latest/'
license=('MIT')

# https://github.com/spotDL/spotify-downloader/blob/master/pyproject.toml
depends=(
	'ffmpeg'
	'python'
	'python-bandcamp-api'
	'python-beautifulsoup4'
	'python-dacite'
	'python-demjson3'
	'python-fastapi'
	'python-jinja'
	'python-mutagen'
	'python-platformdirs'
	'python-pydantic'
	'python-pykakasi'
	'python-python-multipart'
	'python-pytube'
	'python-rapidfuzz'
	'python-requests'
	'python-rich'
	'python-soundcloud-v2'
	'python-slugify'
	'python-spotipy'
	'python-syncedlyrics'
	'python-typing_extensions'
	'python-websockets'
	'python-ytmusicapi'
	'python-datastar-py'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
# checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
provides=('python-spotdl')
replaces=('python-spotdl')
conflicts=('python-spotdl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e4fe531ac332cbdce34385c9da79aa7ba61d914c6cd150f5fd796b1679f99d6a14685dd324ee10079c82cb776582dcf4078c1796c2225147d66ed0bdf71d40e7')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	cd spotify-downloader-$pkgver
	python -m build --wheel --no-isolation
}

# check() {
# 	cd spotify-downloader-$pkgver
# 	pytest || echo 'Tests failed!'
# }

package() {
	cd spotify-downloader-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
