# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.1.10
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
b2sums=('110d36eaeb8d96e239cd1a6ff81cf79ef3d3f0da82fa4efd6f097b2211bcd20f4804752c01223638a4c5f5771cd8de296c745e5d3b9c19186b8ad52673a7e86c')

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
