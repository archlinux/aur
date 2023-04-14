# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=yewtube-git
_pkgname=yewtube
pkgver=2.10.2.r3.g60a526c
pkgrel=2
pkgdesc="Terminal based YouTube jukebox with playlist management - git develop release"
url='https://github.com/mps-youtube/yewtube'
arch=('any')
license=('GPL3')
depends=(
    python
    python-brotli
    python-httpx-git # only until their next release
    python-pafy
    python-pycryptodomex
    python-pylast
    python-pyperclip
    python-rfc3986
    python-setuptools
    python-websockets
    youtube-search-python-git
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
)
optdepends=(
    'mpv: Alternative to mplayer for playback'
    'mplayer: Alternative to mpv for playback'
    'ffmpeg: for transcoding downloaded content'
)
provides=(
    mps-youtube{,-git}
    termitube{,-git}
)
conflicts=(
    mps-youtube{,-git}
    termitube{,-git}
)
replaces=(
    mps-youtube{,-git}
    termitube{,-git}
)
install=yewtube.install
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
    cd ${_pkgname}
    git clean -dfx
}
build() {
    cd ${_pkgname}
    python -m build --wheel --no-isolation
}
package() {
    cd ${_pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
