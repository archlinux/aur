# Maintainer: Deepjyoti <deep.barman30@gmail.com>

_pkgname="ytmdl"
pkgname="$_pkgname"
pkgver=2023.11.26
pkgrel=2
pkgdesc="Download songs from YouTube with metadata from iTunes, Spotify, LastFM, etc"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')

depends=(
  'python-beautifulsoup4'
  'python-musicbrainzngs'
  'python-mutagen'
  'python-pyxdg'
  'python-rich'
  'python-unidecode'
  'python-urllib3'
  'python-ytmusicapi'
  'yt-dlp'

  # AUR
  'downloader-cli'
  'python-ffmpeg-python'
  'python-itunespy'
  'python-pydes'
  'python-simber'
  'python-spotipy'
  'youtube-search-python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check

  python "utils/completion.py"
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm664 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 "ytmdl.zsh" "$pkgdir/usr/share/zsh/site-functions/_ytmdl"
  install -Dm644 "ytmdl.bash" "$pkgdir/usr/share/bash-completion/completions/ytmdl"
}
