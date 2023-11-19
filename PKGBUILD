# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.2.2
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
	'python-typing-extensions'
	'python-ytmusicapi'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest-asyncio')
provides=("$pkgname" 'spotdl')
options=(strip emptydirs zipman)

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
# source=("https://github.com/spotDL/spotify-downloader/archive/refs/tags/v$pkgver.zip")
b2sums=('1ad8182761a0e30d8a2b2735ca4a140d56a901e54524767b31e66a7b13a6e69ee5b71d6ae5d94a54b767d213a4c1001a6195515ad0962ccb16e3c51e07e5cdea')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	cd spotdl-$pkgver
	# https://github.com/python-poetry/poetry/issues/5547
	python -m build --wheel --no-isolation
}

check() {
	cd spotdl-$pkgver
	pytest || echo 'Tests failed!'
}

package() {
	cd spotdl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
