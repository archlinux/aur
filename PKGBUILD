# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.1.8
pkgrel=1

pkgdesc='Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found).'
arch=('any')
url='https://github.com/spotDL/spotify-downloader'
license=('MIT')

depends=(
	'ffmpeg'
	'python'
	'python-beautifulsoup4'
	'python-fastapi'
	'python-mutagen'
	'python-platformdirs'
	'python-pydantic'
	'python-pykakasi'
	'python-pytube'
	'python-rapidfuzz'
	'python-requests'
	'python-rich'
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
# install="spotdl.install"

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
# source=("https://github.com/spotDL/spotify-downloader/archive/refs/tags/v$pkgver.zip")
b2sums=('350f7b4dc3d4ddc2ba29bfa1445a59abbf9bc7f24f4c79c926094ea828859d9b453e47f7ab56c2b8e34152cfd4c04a5113ad3dda8fddc6a9878c2c729c17f83a')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	pushd spotdl-$pkgver
	# https://github.com/python-poetry/poetry/issues/5547
	GIT_DIR=. python -m build --wheel --no-isolation
	popd
}

check() {
	pushd spotdl-$pkgver
	pytest || echo 'Tests failed!'
	popd
}

package() {
	pushd spotdl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	popd
}
