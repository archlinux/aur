# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.0.6
pkgrel=1

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
b2sums=('af7337437a39dd8bc143809f5d9161713916816d473bbd1aec380584e6e39e6c48e81c6403a155f11768eedeb637e7859ee19dc44736ab3961cbec1225576505')

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
