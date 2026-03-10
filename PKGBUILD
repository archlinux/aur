# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Peter <your@email.com>

pkgname=ytm-player
pkgver=1.5.0
pkgrel=1
pkgdesc="A full-featured YouTube Music TUI client with vim-style navigation"

arch=('any')
url="https://github.com/peternaame-boop/${pkgname}"
license=('MIT')

depends=(
    'mpv'
    'python'
    'python-aiosqlite'
    'python-click'
    'python-mpv'
    'python-pillow'
    'python-textual>=7.0'
    'python-ytmusicapi'
    'yt-dlp'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'python-anyascii: lyrics transliteration to ASCII'
    'python-dbus-next: MPRIS media key support'
    'python-pylast: Last.fm scrobbling'
    'python-pypresence: Discord Rich Presence'
    'python-spotipy: Spotify playlist import (AUR)'
    'python-thefuzz: Spotify import fuzzy matching (AUR)'
)

provides=("${pkgname%%-player}")
conflicts=("${pkgname}"{-git,-bin})

source=("git+${url}.git#tag=v${pkgver}")

sha256sums=('2b33c934d7b2bf39f98f8705604f4fc6b980dc4223b99d039afd383ceb091451')

build() {
    cd ${pkgname} || exit

    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname} || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
