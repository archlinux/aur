# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=lib32-$_pkgbasename
pkgver=4.1
pkgrel=2
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL3')
depends=("$_pkgbasename"
      'lib32-alsa-lib'
#      'lib32-aom'
      'lib32-bzip2'
      'lib32-fontconfig'
      'lib32-fribidi'
      'lib32-glibc'
      'lib32-gmp'
      'lib32-gnutls'
      'lib32-gsm'
      'lib32-jack'
      'lib32-lame'
      'lib32-libavc1394'
      'lib32-libdrm'
      'lib32-libiec61883'
      'lib32-libmodplug'
      'lib32-libomxil-bellagio'
      'lib32-libpulse'
      'lib32-libraw1394'
#      'lib32-libsoxr'
#      'lib32-libssh'
      'lib32-libtheora'
      'lib32-libvdpau'
      'lib32-libwebp'
      'lib32-libx11'
      'lib32-libxcb'
      'lib32-libxext'
      'lib32-libxml2'
      'lib32-libxv'
      'lib32-opencore-amr'
      'lib32-openjpeg2'
      'lib32-opus'
      'lib32-sdl2'
      'lib32-speex'
      'lib32-v4l-utils'
      'lib32-xz'
      'lib32-zlib'
      'lib32-libass'
      'lib32-libbluray'
      'lib32-freetype2'
      'lib32-libva'
#      'lib32-vid.stab'
      'lib32-libvorbis'
      'lib32-libvpx'
      'lib32-x264'
      'lib32-x265'
      'lib32-xvidcore'
      )
makedepends=('ffnvcodec-headers' 'lib32-ladspa' 'yasm')
optdepends=('lib32-ladspa: LADSPA filters')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}")
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('SKIP')

prepare() {
  cd ${_pkgbasename}

  # Patching if needed
}

build() {
  cd ${_pkgbasename}

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --shlibdir=/usr/lib32 \
    --cc="gcc -m32" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-nvenc \
    --enable-omx \
    --enable-shared \
    --enable-version3

#    --enable-libdrm \ ## We would like to use it, but it seems to be broken for now. There is a problem with a va function.


#    --enable-libsoxr \
#    --enable-libaom \ ## Not available under 32bit
#    --enable-libssh \  ## not available under 32bit
#    --enable-libvidstab \ ## not available under 32bit
#    --enable-libx265 \ ## libx265 is not properly detected under 32bit arch

  make
}

package() {
  cd ${_pkgbasename}

  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}

# vim:set ts=2 sw=2 et:
