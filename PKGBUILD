# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=yewtube-git
_pkgname=yewtube
pkgver=2.10.4.r0.g49e75e9
pkgrel=1
pkgdesc="Terminal based YouTube player and downloader. No Youtube API key required."
url='https://github.com/mps-youtube/yewtube'
arch=('any')
license=('GPL3')
depends=(
    python
    python-brotli
    python-httpx
    python-pafy
    python-pip
    python-pycryptodomex
    python-pylast
    python-pyperclip
    python-requests
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
    mps-youtube{,-hd}{,-git}
    termitube{,-git}
)
conflicts=(
    mps-youtube{,-hd}{,-git}
    termitube{,-git}
)
replaces=(
    mps-youtube{,-hd}{,-git}
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
