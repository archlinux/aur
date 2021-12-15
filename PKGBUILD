# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.9.1
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
	'python-unidecode')
makedepends=('python-setuptools')
provides=("$pkgname" "spotdl")
options=(strip emptydirs zipman)
# install="spotdl.install"

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
b2sums=('b5228f33d2c9fc7ea0e500ab436c63a5a5aedc3ed6eae7cc8f8f8ad0607aee82c279a5bbc31c51d6faa30b2aab9ff3caca2091bccd1cb965d3ebe2b409ff9d26')

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
	popd
}
