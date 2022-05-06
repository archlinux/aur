# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=ffmpeg-decklink
pkgver=5.0.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
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
  decklink-sdk
)
optdepends=('avisynthplus: for AviSynthPlus support'
            'intel-media-sdk: for Intel Quick Sync Video'
            'ladspa: for LADSPA filters'
            'nvidia-utils: for Nvidia NVDEC/NVENC support')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-vmaf-2.x.patch'
        '060-ffmpeg-fix-segfault-with-avisynthplus.patch'
        '070-ffmpeg-libsvtav1-0.9.0-part1.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/c33b4048859a191acf9b6aa22acaea248a4eb18f'
        '080-ffmpeg-libsvtav1-0.9.0-part2.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1dddb930aaf0cadaa19f86e81225c9c352745262'
        'LICENSE')
sha256sums=('ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b'
            'SKIP'
            '91973c465f01446a999f278f0c2a3763304994dba1ac35de0e4c72f12f39409e'
            'eb044a095ba72ebe63de53f15952aa0100bb27ee691cf3d3a205d5a597c72a7d'
            '887c2e440b159b7c3575a12eb17e1297b76f9468b65b96ef2674b7bb36b12fcf'
            '65a455c6ef110cd06196b48e53f36b87cb2a90fccfdd65fe25cd225b2524fa22'
            '9de88ea609fddf8437536b6cf7c9b4039bde4fa560977cdeba14b87b8dcca31c'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-vmaf-2.x.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg-libsvtav1-0.9.0-part1.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/080-ffmpeg-libsvtav1-0.9.0-part2.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
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
        --enable-version3 \
        --enable-nonfree \
        --enable-decklink
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
