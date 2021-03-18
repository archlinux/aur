# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.4.1
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('d79981301b23344132949fcdc5ba2b41b62892cd16275f0538cc026c34313e3727d28d4e24c055fe4b64a67b59aae6201721543b741c791c541c3b6ef6e28a77')

build() {
  cd spotdl-$pkgver

  # bs4 is a metapackage, we have to install beautifulsoup4 instead
  sed -i 's/bs4/beautifulsoup4/' setup.cfg

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

