# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp-git
pkgver=2022.02.04.r94.g45806d44a
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (git)'
arch=(any)
url=https://github.com/yt-dlp/yt-dlp
license=(Unlicense)
depends=(python)
makedepends=(git python-setuptools pandoc)
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-mutagen: For embedding thumbnail in certain formats'
            'python-pycryptodomex: For decrypting AES-128 HLS streams and various other data'
            'python-websockets: For downloading over websocket')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    make pypi-files
    python setup.py build
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
