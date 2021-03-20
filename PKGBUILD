# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.4.2
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('a0399ef0200e99699206eb3a2ad5a94b81d8ae853c5824ff4913f0f0139e6307cc4744801c10963e4ea1fffb0992fd6c30b0712e3ba2ad921b592b1fb6ebda5a')

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

