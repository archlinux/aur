# Maintainer: captience <milkkjello@gmail.com>
pkgname=tide
pkgver=2.1.0
pkgrel=1
pkgdesc="A multi-source music player with two personalities"
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
  'python-pypresence: Discord rich presence integration'
  'python-secretstorage: GNOME/libsecret backend for cookie import'
  'kwallet: KDE wallet backend for cookie import'
  'python-watchdog: live re-indexing of the local files source'
  'librespot: Spotify Premium playback via the librespot backend'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# computed from the GitHub tag tarball at release time (updpkgsums once
# v$pkgver is tagged and pushed); until then this is the previous release's.
sha256sums=('9296619eb9340a2a3dfcbf4ac2ace1d2593efa4e6dc52e94710fc98598c7e44c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
