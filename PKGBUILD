# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.0.7
pkgrel=2

pkgdesc="Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found)."
arch=('any')
url="https://github.com/spotDL/spotify-downloader"
license=('MIT')

depends=('python'
	'ffmpeg'
	'python-spotipy'
	'python-pytube'
	'python-rich'
	'python-rapidfuzz'
	'python-mutagen'
	'python-ytmusicapi'
	'yt-dlp'
	'python-tqdm'
	'python-beautifulsoup4'
	'python-requests'
	'python-unidecode'
	'python-pycryptodomex'
	'python-websockets'
	'python-async-timeout'
	'python-packaging'
	'python-setuptools'
	'python-brotli'
	'python-slugify'
	'python-nest-asyncio'
	'python-fastapi'
	'uvicorn'
	'python-platformdirs'
	'python-jarowinkler')
provides=("$pkgname" "spotdl")
options=(strip emptydirs zipman)
# install="spotdl.install"

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
b2sums=('8c595d47c3009f5029ac32b9140195745bea3004f931026e4fdf38f31e8a3d3e690b2dfa341612f75845565e9e3a4ef1903fa04056e380f8392eb3ab39bbf376')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	pushd spotdl-$pkgver
	python setup.py build
	popd
}

package() {
	pushd spotdl-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "${pkgdir}${site_packages}/tests/"
	popd
}
