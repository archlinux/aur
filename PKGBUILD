# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=ffmpeg-decklink
pkgver=6.0
pkgrel=4
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
  libbs2b.so
  libdav1d.so
  libdrm
  libfreetype.so
  libgl
  libiec61883
  libjxl.so
  libmodplug
  libopenmpt.so
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
  ocl-icd
  onevpl
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vmaf
  vulkan-icd-loader
  xz
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
  decklink-sdk
)
optdepends=('avisynthplus: for AviSynthPlus support'
            'ladspa: for LADSPA filters'
            'nvidia-utils: for Nvidia NVDEC/NVENC support'
            'onevpl-intel-gpu: for Intel Quick Sync Video')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '060-ffmpeg-fix-segfault-with-avisynthplus.patch'
        '070-ffmpeg-binutils2.41-fix.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb'
        '080-ffmpeg-nvenc-fix-010.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/03823ac0c6a38bd6ba972539e3203a592579792f'
        '090-ffmpeg-nvenc-fix-020.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/d2b46c1ef768bc31ba9180f6d469d5b8be677500'
        'LICENSE')
sha256sums=('57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082'
            'SKIP'
            'd1ad786df86354d218a70b306a50961736c0a6e2d2716bf8de3db31d79957df9'
            'bf563193f450ece58a93db6840c0db33875df945fa81477b9b02fb209d3bf57a'
            'fec03e133521486ca258ae34ddf093eb6aab23f848c4332c367aadbfeaefda04'
            'aa8c43efac4c0dfc462af887b56bdb177cf09dd8b2dffea5c83a4dbfc35e0917'
            '3fe87a3bd193f16a191ff795ae8ad62d930e48d7b379fc627043717a6bdf3e93'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg-binutils2.41-fix.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/080-ffmpeg-nvenc-fix-010.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/090-ffmpeg-nvenc-fix-020.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --disable-htmlpages \
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
        --enable-libbs2b \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libjxl \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopenmpt \
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
        --enable-libvpl \
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
        --enable-opencl \
        --enable-opengl \
        --enable-shared \
        --enable-version3 \
        --enable-vulkan \
        --enable-decklink \
        --enable-nonfree
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
