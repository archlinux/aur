# Maintainer: captience <milkkjello@gmail.com>
pkgname=tide
pkgver=3.1.0
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
sha256sums=('fa242314ce578fd5207ca30c246e94aee73344577b905baff1a62f08e55272df')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
