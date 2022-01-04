# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.9.2
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
b2sums=('0d4029f827785e10feb97aeaa4b3b66e7e37d92b7b6d93c1fa3ed8df9b5c7b95ff8408b9160a4d607937c2cc8c4b17d5ac9893a25ecf7d86011f7c07a9e1a77f')

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
