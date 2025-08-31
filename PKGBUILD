# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=spotdl
pkgver=4.4.2
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
	'python-mutagen'
	'python-platformdirs'
	'python-pydantic'
	'python-pykakasi'
	'python-pytube'
	'python-rapidfuzz'
	'python-requests'
	'python-rich'
	'python-soundcloud-v2'
	'python-slugify'
	'python-spotipy'
	'python-syncedlyrics'
	'python-typing_extensions'
	'python-ytmusicapi'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
# checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
provides=('python-spotdl')
replaces=('python-spotdl')
conflicts=('python-spotdl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('405f9717332aa68e03752ac46579d55176a4a91e03a5d6118125a0c20a09bf712c81d5f7a5bf79a14fd2d1f15b24651a2d85fd1d55ae0e6fc32a0d2a97e934b0')

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
