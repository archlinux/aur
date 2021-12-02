# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.9.0
pkgrel=5

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
b2sums=('523b81f907e078dd0edbb699cc3014531870b447e079c4f56f80ed9bc671356d7d36d31524eb4ebbafe2b96fdbd36e1d7b8c7b8b847f54774b94b855e36c2d26')

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
