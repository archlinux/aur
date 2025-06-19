# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=("lib32-$_pkgbasename")
pkgver=7.1.1
pkgrel=2
epoch=2
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org"
license=('GPL-3.0-only')
replaces=("lib32-lib$_pkgbasename")
conflicts=("lib32-lib$_pkgbasename")
depends=(
#  "$_pkgbasename"
  "$_pkgbasename>=${epoch}:${pkgver}"
  'lib32-alsa-lib'
  'lib32-aom'
  'lib32-bzip2'
#  'lib32-cairo'
  'lib32-fontconfig'
  'lib32-fribidi'
#  'lib32-glib2'
  'lib32-glibc'
  'lib32-glslang'
  'lib32-gmp'
  'lib32-gnutls'
  'lib32-gsm'
  'lib32-jack'
  'lib32-lame'
  'lib32-libass'
  'lib32-libavc1394'
  'lib32-libbluray'
  'lib32-libbs2b'
  'lib32-libdav1d'
  'lib32-libdrm'
  'lib32-libdvdnav'
  'lib32-libdvdread'
  'lib32-freetype2'
  'lib32-libglvnd'
  'lib32-harfbuzz'
  'lib32-libiec61883'
#  'lib32-libjxl'
#  'lib32-onevpl'
  'lib32-libmodplug'
#  'lib32-libopenmpt'
  'lib32-libplacebo'
  'lib32-libpulse'
  'lib32-rav1e'
  'lib32-libraw1394'
  'lib32-librsvg'
#  'lib32-rubberband'
#  'lib32-libsoxr'
#  'lib32-libssh'
  'lib32-libtheora'
  'lib32-libva'
  'lib32-libvdpau'
#  'lib32-vid.stab'
  'lib32-libvorbis'
  'lib32-libvpx'
  'lib32-libwebp'
  'lib32-libx11'
  'lib32-x264>=3:0.161'
  'lib32-x265>=3.5'
  'lib32-libxcb'
  'lib32-libxext'
  'lib32-libxml2'
  'lib32-libxv'
  'lib32-xvidcore'
  'lib32-zimg'
  'lib32-ocl-icd'
  'lib32-opencore-amr'
  'lib32-openjpeg2'
  'lib32-opus'
  'lib32-sdl2'
#  'lib32-snappy'
  'lib32-speex'
  'lib32-srt'
#  'lib32-svt-av1'
  'lib32-v4l-utils'
#  'lib32-vapoursynth'
  'lib32-vmaf'
  'lib32-vulkan-icd-loader'
  'lib32-xz'
  'lib32-zlib'
)
makedepends=(
#  'avisynthplus'
  'amf-headers'
  'lib32-clang'
  'ffnvcodec-headers'
#  'lib32-frei0r-plugins'
  'git'
  'lib32-ladspa'
  'lib32-mesa'
#  'lib32-zeromq'
  'nasm'
  'opencl-headers'
  'vulkan-headers'
)
optdepends=(
#  'avisynthplus: AviSynthPlus support'
#  'frei0r-plugins: Frei0r video effects support'
#  'intel-media-sdk: Intel QuickSync support (legacy)'
  'lib32-ladspa: LADSPA filters'
  'lib32-nvidia-utils: Nvidia NVDEC/NVENC support'
#  'onevpl-intel-gpu: Intel QuickSync support'
#  'vapoursynth: VapourSynth support'
)
provides=(
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libpostproc.so'
  'libswresample.so'
  'libswscale.so'
)
options=(
#  debug
)
_tag=a1328e68877e12ab5a6e5d92a84aefa566783ea5
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  0001-Add-av_stream_get_first_dts-for-Chromium.patch
  0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch
  fix_build_with_v4l2_1.30.patch
)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
b2sums=(
  'c7b1a56593f123de8e18b3b93c81dca4aff439f5701935cc1fe6316543e8c3256acd7f95b4a533eb7ba30e346fa13bf0ad5bff54b7822c088ef3939882416a7c'
  'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d'
  'a32aeff68032a78d661011654bbdba138002833f7d17d23bba6f95479ca22bef5697eb9e7e4cb9e0b5140fc23eab3aab16fc60962d62809c3c02f890599a8332'
  'a713b3a4243cc5de3867f7c210172c094f50bd614c0c8be2c99d6161b06d43d9183ae9c442ac3056bfe06c28419e276d129b1235471466eedd340bf0c4780acb'
)
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ${_pkgbasename}

  # Patching if needed

  # Fix build with v4l2 >= 1.30
  # https://trac.ffmpeg.org/ticket/11570
  patch -Np1 -i "${srcdir}/fix_build_with_v4l2_1.30.patch"

  # https://crbug.com/1251779
  git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch

  # Fix for svt-av1
  # Taken from https://github.com/FFmpeg/FFmpeg/commit/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95.patch
  git apply -3 ../0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch

  # VAAPI HEVC encode alignment fix
  git cherry-pick -n bcfbf2bac8f9eeeedc407b40596f5c7aaa0d5b47
  git cherry-pick -n d0facac679faf45d3356dff2e2cb382580d7a521
}

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/^n//'
}

build() {
#  export PKG_CONFIG_PATH='/usr/lib32/mbedtls2/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}

  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --shlibdir=/usr/lib32 \
    --cc="gcc -m32" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-cuda-llvm \
    --enable-lto \
    --disable-inline-asm \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-libharfbuzz \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libdvdnav \
    --enable-libdvdread \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libglslang \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libplacebo \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxvid \
    --enable-libxml2 \
    --enable-libzimg \
    --enable-nvenc \
    --enable-nvdec \
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-version3 \
    --enable-vulkan \
    --disable-doc

## not available under 32 bit
#    --enable-avisynth \
#    --enable-frei0r \
#    --enable-libjxl \
#    --enable-libopenh264
#    --enable-libopenmpt \
#    --enable-librubberband \
#    --enable-libsnappy \
#    --enable-libsoxr \
#    --enable-libssh \
#    --enable-libsvtav1 
#    --enable-libuavs3d
#    --enable-libvidstab \
#    --enable-libvpl \
#    --enable-vapoursynth \
#    --enable-libzmq \

  make
}

package_lib32-ffmpeg() {
  make DESTDIR="${pkgdir}" -C ffmpeg install

  # Keep files in bin since this is not a library only package. 
  # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
  # which is "--program-suffix="-32" with Autoconf
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "${pkgdir}"/usr/{include,share}
}