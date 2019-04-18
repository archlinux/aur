# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ffmpeg-compat-56
pkgver=2.8.15
pkgrel=1
pkgdesc="Compatibility package for ffmpeg to provide versions 56 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=( 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('gsm' 'lame' 'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'libvpx'
         'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'libpulse'
         'libtheora' 'libbluray' 'libmodplug' 'libva' 'libxv' 'sdl' 'jack')
makedepends=('yasm' 'libass')
provides=('libavcodec.so' 'libavdevice.so' 'libavformat.so')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        "http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2.asc")
sha256sums=('35647f6c1f6d4a1719bc20b76bf4c26e4ccd665f46b5676c0e91c5a04622ee21'
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
    --disable-libx264 \
    --enable-libxvid \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --disable-doc \
    --disable-programs \
    --disable-avresample \
    --disable-avfilter \
    --disable-postproc \
    --disable-swresample \
    --disable-swscale
  make
}

package() {
  cd "ffmpeg-${pkgver}"
  make DESTDIR="${pkgdir}" install-libs
  cd "${pkgdir}/usr/lib"
  rm -f *.so libavutil.*
}

