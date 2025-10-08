# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=spotdl
pkgver=4.4.3
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
b2sums=('db5fd8804476efdf3a0cec7785c42df4e7a68cf237c903f1dcfdedca52b038fbc78cf79ab089c1ab689fc6b383309c3fbc63b8baf1333d3625e34c13a5de34a0')

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
