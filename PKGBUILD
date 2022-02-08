# Maintainer: Eximius <eximius@gmx.com>
# Contributor: lobomfz <lobomfz@protonmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Matthew Sexton <wsdmatty@gmail.com>
# Contributor: sgtxd <mark@sgtxd.de>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgbase=ffmpeg-compat-59
pkgname=ffmpeg-compat-59
pkgver=5.0
pkgrel=1
pkgdesc="Compatibility package for ffmpeg to provide versions 59 of libavcodec, libavdevice and libavformat, not anymore provided by ffmpeg-git"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=(
  alsa-lib
  aom
  bzip2
  fontconfig
  fribidi
  gmp
  gnutls
  gsm
  jack
  lame
  libass.so
  libavc1394
  libbluray.so
  libdav1d.so
  libdrm
  libfreetype.so
  libiec61883
  libmfx
  libmodplug
  libpulse
  librav1e.so
  libraw1394
  librsvg-2.so
  libsoxr
  libssh
  libtheora
  libva.so
  libva-drm.so
  libva-x11.so
  libvdpau
  libvidstab.so
  libvorbisenc.so
  libvorbis.so
  libvpx.so
  libwebp
  libx11
  libx264.so
  libx265.so
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  libzimg.so
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vmaf
  xz
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

provides=('libavcodec.so=59' 'libavdevice.so=59' 'libavfilter.so=7'
          'libavformat.so=59' 'libavutil.so=56'
          'libpostproc.so=55' 'libswresample.so=3' 'libswscale.so=5')

source=(
  http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz
)

sha256sums=(
  '51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298'
)

prepare() {
  cd ffmpeg-5.0
}

build() {
  cd ffmpeg-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-avisynth \
    --enable-cuda-llvm \
    --enable-lto \
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
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-nvdec \
    --enable-nvenc \
    --enable-shared \
    --enable-version3

  make
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="${pkgdir}" install-libs
  cd "${pkgdir}/usr/lib"
  rm -f *.so
}
