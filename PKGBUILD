# Maintainer: Fabio Ferreira <fabio86ferreira@gmail.com>

pkgname=vtrim
pkgver=0.1.1
pkgrel=1
pkgdesc="Millisecond-precision desktop video trimmer (Qt 6 + FFmpeg)"
arch=('x86_64')
url="https://github.com/fabioferreira3/video-trimmer"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'qt6-multimedia-ffmpeg'
    'ffmpeg'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'gcc'
)
# The upstream repo is named `video-trimmer` (the AUR/binary name `vtrim` is
# only used here, to avoid colliding with extra/video-trimmer). The GitHub
# tag is `v$pkgver`; the tarball it ships extracts as `video-trimmer-$pkgver/`.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a1cdfb86af8213ee95666ae25e3178ba526758118caea63349e153bdf20b0f6')

_srcdir="video-trimmer-$pkgver"

build() {
    cmake -S "$_srcdir" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Wno-dev
    cmake --build build -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
