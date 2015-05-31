# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=ffmpeg-usdx
_srcname=ffmpeg
pkgver=0.10.5
pkgrel=3
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix (older version for USDX)"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('alsa-lib' 'bzip2' 'gsm' 'lame' 'libpulse' 'libtheora' 'libva' 'libvorbis' 'libvpx' 'opencore-amr' 'openjpeg' 'rtmpdump' 'schroedinger' 'sdl' 'speex' 'v4l-utils' 'x264' 'xvidcore' 'zlib')
makedepends=('yasm' 'git' 'libvdpau')
source=(
  "http://ffmpeg.org/releases/${_srcname}-${pkgver}.tar.bz2"
)
sha256sums=(
  '47f26011e2d0d31641e91bb1fbcb907f4aa654d93732d5362711f38c2db4faa9'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
    ./configure --prefix=/usr \
                --incdir=/usr/include/ffmpeg-usdx \
                --shlibdir=/usr/lib/ffmpeg-usdx \
                --libdir=/usr/lib/ffmpeg-usdx \
                --extra-cflags=-I/usr/include/openjpeg-1.5/ \
                --enable-libmp3lame --enable-libvorbis --enable-libxvid \
                --enable-libx264 --enable-libvpx --enable-libtheora \
                --enable-libgsm --enable-libspeex --enable-postproc \
                --enable-shared --enable-x11grab --enable-libopencore_amrnb \
                --enable-libopencore_amrwb --enable-libschroedinger --enable-libopenjpeg \
                --enable-librtmp --enable-libpulse --enable-libv4l2 \
                --enable-gpl --enable-version3 --enable-runtime-cpudetect \
                --disable-debug --disable-static --disable-doc \
                --disable-ffmpeg --disable-ffplay --disable-ffprobe \
                --disable-ffserver
  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
