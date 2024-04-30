# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>
_pkgname=bandcamp_tagplayer
pkgname=python-bandcamp-tagplayer-git
pkgver=r114.39c969c
pkgrel=1
arch=("any")
pkgdesc="Autoloads an MPD playlist with a Bandcamp genre or user library"
url="https://github.com/greggparrish/bandcamp_tagplayer"
license=("Unlicense")
depends=(
    'python'
    'python-args'
    'python-beautifulsoup4'
    'python-blessed'
    'python-certifi'
    'python-chardet'
    'python-clint'
    'python-idna'
    'python-lxml'
    'python-mutagen'
    'python-ply'
    'python-mpd2'
    'python-requests'
    'python-six'
    'python-soupsieve'
    'python-unidecode'
    'python-urllib3'
    'python-wcwidth'
)
optdepends=(
    'mpd: For playing generated playlists'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$_pkgname::git+https://github.com/greggparrish/bandcamp_tagplayer")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
