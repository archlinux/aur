# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.0.5
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
	'python-jarowinkler')
provides=("$pkgname" "spotdl")
options=(strip emptydirs zipman)
# install="spotdl.install"

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
b2sums=('a632ac79d1dfaff2f0a6c2f40b86e8f11f6e51b2f2447f873d816e2a18bccde6410a9f4fae660b38f6168421ff5f8159e0b8f83104ad9b6c18db7f2b23a3d2cf')

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
