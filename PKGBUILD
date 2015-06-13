# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ffmpeg-compat-54
pkgver=1.2.1
pkgrel=1
pkgdesc="Compatibility package for ffmpeg to provide versions 54 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('gsm' 'lame' 'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'libvpx'
         'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'libpulse'  'libx264'
         'libtheora' 'libbluray' 'libmodplug' 'sdl' 'jack' 'libavutil-52')
makedepends=('yasm' 'libass')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        "freetype2.patch")
sha256sums=('0302375c3a64e9c2facfa7cbeb1aa333a39fdf6bbacda228cd48e04bf9ee32ca'
            '03e7e303f864e04ad1cae1af82c0179e111f9ef580634c72a315f22589a6d2ea')

prepare() {
  cd "ffmpeg-${pkgver}"
  patch -p1 -i "${srcdir}/freetype2.patch"
}

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

