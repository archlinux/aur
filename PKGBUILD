# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.9.0
pkgrel=4

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

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/spotDL/spotify-downloader/master/LICENSE")
b2sums=('523b81f907e078dd0edbb699cc3014531870b447e079c4f56f80ed9bc671356d7d36d31524eb4ebbafe2b96fdbd36e1d7b8c7b8b847f54774b94b855e36c2d26'
	'566d005f958503cdc6c9552483e9b71bec72eec0afc2965e9c56509ecafd163d948c8385c757d5b2fafd0ef2704abe0d3171fe32e6b43f64b7b80f4e02a50293')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	pushd spotdl-$pkgver
	python setup.py build
	popd
}

package() {
	pushd spotdl-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	popd

	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
