# Maintainer: captience <milkkjello@gmail.com>
pkgname=tide
pkgver=3.2.0
pkgrel=1
pkgdesc="A YouTube Music client for Linux"
arch=('any')
url="https://github.com/captiencelovesarch/tide"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.12'
  'pyside6'
  'python-mpv'
  'mpv'
  'yt-dlp'
  'python-ytmusicapi'
  'python-cryptography'
  'python-numpy'
  'python-mutagen'
  'python-spotipy'
)
optdepends=(
  'python-secretstorage: GNOME/libsecret backend for cookie import'
  'kwallet: KDE wallet backend for cookie import'
  'python-pycryptodomex: much faster cookie reads from chromium browsers'
  'python-watchdog: live re-indexing for the local files plugin'
  'librespot: Spotify Premium playback via the librespot backend'
  'python-onnxruntime-cpu: the precise lyric timing plugin, and voice in vr'
  'python-yaml: word-synced lyrics from LRClib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# computed from the GitHub tag tarball at release time (updpkgsums once
# v$pkgver is tagged and pushed); until then this is the previous release's.
sha256sums=('07be2c2e68da1c69a248bc86c956e5d6b8b7743c372011652858d0023174a92d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
