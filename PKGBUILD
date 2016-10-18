# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=libavutil-52
pkgver=2.3.6
pkgrel=3
pkgdesc="Compatibility package for ffmpeg to provide versions 52 of libavutil not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
makedepends=('yasm' 'gsm' 'lame' 'opencore-amr' 'openjpeg' 'opus'  'rtmpdump'
             'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'libpulse' 'libvpx'
             'libx264' 'libtheora' 'libvdpau' 'libass' 'libbluray' 'libmodplug')
provides=('libavutil.so')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        "http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2.asc")
sha256sums=('cf1be1c5c3973b8db16b6b6e8e63a042d414fb5d47d3801a196cbba21a0a624a'
            'SKIP')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

build() {
  cd "ffmpeg-${pkgver}"

  ./configure \
    --prefix=/usr \
    --incdir="/usr/include" \
    --shlibdir="/usr/lib" \
    --libdir="/usr/lib" \
    --disable-debug \
    --disable-static \
    --enable-dxva2 \
    --disable-fontconfig \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libxvid \
    --enable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --disable-doc \
    --disable-programs \
    --disable-avcodec \
    --disable-avdevice \
    --disable-avformat \
    --disable-swscale \
    --disable-swresample \
    --disable-postproc \
    --disable-avfilter
}

package() {
  cd "ffmpeg-${pkgver}"
  install -d -m 755 "${pkgdir}/usr/lib"
  make DESTDIR="${pkgdir}" install-libs
  # Remove symlink which conflicts with ffmpeg
  rm -f "${pkgdir}/usr/lib/libavutil.so"
}

