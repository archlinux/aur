# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: lobomfz <lobomfz@protonmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Matthew Sexton <wsdmatty@gmail.com>
# Contributor: sgtxd <mark@sgtxd.de>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=ffmpeg-compat-58
pkgver=4.4.2
pkgrel=2
pkgdesc="Compatibility package for ffmpeg to provide versions 58 of libavcodec, libavdevice and libavformat, not anymore provided by ffmpeg-git"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=(
  alsa-lib
  aom
  bzip2
  dav1d
  fontconfig
  freetype2
  fribidi
  gmp
  gnutls
  gsm
  jack
  lame
  libass
  libavc1394
  libbluray
  libdrm
  libiec61883
  libmfx
  libmodplug
  libpulse
  libraw1394
  librsvg
  libsoxr
  libssh
  libtheora
  libva
  libvdpau
  libvorbis
  libvpx
  libwebp
  libx11
  libxcb
  libxext
  libxml2
  libxv
  opencore-amr
  openjpeg2
  opus
  rav1e
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vid.stab
  x264
  x265
  xvidcore
  xz
  zimg
  zlib
)

makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  git
  ladspa
  nasm
)

optdepends=(
  'avisynthplus: AviSynthPlus support'
  'intel-media-sdk: Intel QuickSync support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
)

provides=('libavcodec.so=58-64' 'libavdevice.so=58-64' 'libavfilter.so=7-64'
          'libavformat.so=58-64' 'libavutil.so=56-64'
          'libpostproc.so=55-64' 'libswresample.so=3-64' 'libswscale.so=5-64')

conflicts=('ffmpeg4.4')

source=(
  http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz
)

sha256sums=('af419a7f88adbc56c758ab19b4c708afbcae15ef09606b82b855291f6a6faa93')

build() {
  cd ffmpeg-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-doc \
    --disable-programs \
    --disable-static \
    --enable-alsa \
    --enable-amf \
    --enable-avisynth \
    --enable-bzlib \
    --enable-cuda-llvm \
    --enable-lto \
    --enable-ffnvcodec \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-lzma \
    --enable-nvdec \
    --enable-nvenc \
    --enable-sdl2 \
    --enable-shared \
    --disable-sndio \
    --enable-vaapi \
    --enable-vdpau \
    --enable-version3 \
    --enable-xlib \
    --enable-zlib

  make
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="${pkgdir}" install-libs
  cd "${pkgdir}/usr/lib"
  rm -f *.so
}
