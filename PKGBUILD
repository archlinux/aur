# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: orumin <dev@orum.in>
# Contributor: Adam <adam900710 at gmail dot com>

_basename='gst-libav'
pkgname='lib32-gst-libav'
pkgver=1.18.5
pkgrel=1
pkgdesc='Multimedia graph framework - libav plugin (32-bit)'
arch=('x86_64')
url='https://gstreamer.freedesktop.org/'
license=('GPL')
depends=(
    'bzip2'
    'gst-libav'
    'lib32-gst-plugins-base-libs'
    'lib32-libffmpeg'
)
makedepends=(
    'cmake'
    'git'
    'meson'
    'python'
)
provides=("lib32-gst-ffmpeg=${pkgver}-${pkgrel}")
_commit='9db917cab4c20e72e53ed962406a0d94636a2a39' # tags/1.18.5^0
source=("git+https://gitlab.freedesktop.org/gstreamer/${_basename}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename 'build' \
        --libdir='lib32' \
        --libexecdir='lib32' \
        -Ddoc='disabled' \
        -Dpackage-name='GStreamer FFmpeg Plugin (Arch Linux)' \
        -Dpackage-origin='https://www.archlinux.org/'
}

build() {
    meson compile -C 'build'
}

check() {
    meson test -C 'build' --print-errorlogs
}

package() {
    meson install -C 'build' --destdir "${pkgdir}"
}
