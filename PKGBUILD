# $Id: PKGBUILD 228056 2014-12-26 11:57:24Z bpiotrowski $
# Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-headless
pkgver=2.7
pkgrel=1
epoch=1
pkgdesc='The FFmpeg media toolkit optimised for server (headless) systems'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL')
provides=("ffmpeg=$pkgver-$pkgrel")
conflicts=("ffmpeg")
replaces=("ffmpeg")
depends=(
      'bzip2' 'fontconfig' 'gnutls' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libtheora' 'libvorbis' 'libvpx'
      'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'schroedinger' 'speex'
      'v4l-utils' 'libx264' 'xvidcore' 'zlib' 'x265>=1.7' 'fribidi' 'libfdk-aac'
)
makedepends=('yasm' 'hardening-wrapper')
source=(http://ffmpeg.org/releases/ffmpeg-$pkgver.tar.bz2)
md5sums=('5a16425b0bde1b952f58cff71b569a45')

build() {
  cd ffmpeg-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-swresample \
    --enable-version3 \
    --enable-libfdk_aac \
    --enable-nonfree

  make
  make doc/ff{mpeg,server}.1
}

package() {
  cd ffmpeg-$pkgver
  make DESTDIR="$pkgdir" install install-man
}
