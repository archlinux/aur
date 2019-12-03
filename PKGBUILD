# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-libav-git
_gitname=gst-libav
pkgver=1.16.0.r30.g5a9f3d4
pkgrel=1
pkgdesc="Gstreamer libav Plugin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer-git' 'gst-plugins-base-git' 'bzip2' 'ffmpeg')
makedepends=('yasm' 'git' 'meson' 'ninja' )
provides=("gst-libav" "gst-ffmpeg")
conflicts=("gst-libav" "gst-ffmpeg")
optdepends=(
  # 64-bit
  # official repositories:
    'glibc' 'alsa-lib' 'jack' 'libpng'
    'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
    'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394'
    'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm'
    'libiec61883' 'libmodplug' 'lame' 'opencore-amr' 'openjpeg2' 'opus' 'pulseaudio'
    'librsvg' 'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt'
    'libssh' 'tesseract' 'libtheora' 'twolame' 'v4l-utils' 'vid.stab' 'libvorbis'
    'libvpx' 'wavpack' 'libwebp' 'libx264.so' 'x265' 'libxcb' 'xvidcore' 'libxml2'
    'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz' 'openal' 'ocl-icd' 'libgl' 'sndio'
    'sdl2' 'libxv' 'libx11' 'libxext' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm'
    'libvdpau'
  # AUR:
    'chromaprint-fftw' 'codec2' 'flite1-patched' 'libilbc' 'kvazaar' 'openh264'
    'libopenmpt-svn' 'shine' 'vo-amrwbenc' 'xavs' 'ndi-sdk' 'libmysofa'
  'rockchip-mpp'
)
source=('git+https://gitlab.freedesktop.org/gstreamer/gst-libav.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
 cd $_gitname
 git submodule update --init --recursive


}
build() {
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'
  arch-meson $_gitname build \
    -Dpackage-name="GStreamer FFMPEG Plugin (Arch Linux)" \
    -Dpackage-origin="https://www/archlinux.org/" \
    -Ddoc=disabled

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
