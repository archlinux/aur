# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=lib32-$_pkgbasename
pkgver=3.0.1
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL3')
depends=("$_pkgbasename"
      'lib32-alsa-lib' 'lib32-fontconfig' 'lib32-fribidi'
      'lib32-gnutls' 'lib32-gsm' 'lib32-lame' 'lib32-libass'
      'lib32-libavc1394'
      'lib32-libbluray' 'lib32-libiec61883'
      'lib32-libmodplug' 'lib32-libpulse'
      'lib32-libtheora' 'lib32-libva' 'lib32-libvdpau'
      'lib32-libwebp' 'lib32-opencore-amr' 'lib32-openjpeg'
      'lib32-opus' 'lib32-schroedinger'
      'lib32-sdl' 'lib32-speex' 'lib32-v4l-utils'
      'lib32-libxv'
      'lib32-xvidcore' 'lib32-zlib'
      'lib32-libvorbis' 'libvorbis.so' 'libvorbisenc.so'
      'lib32-libx264' 'libx264.so'
      'lib32-libvpx' 'libvpx.so'
      )
makedepends=('hardening-wrapper' 'lib32-ladspa' 'yasm')
optdepends=('lib32-ladspa: LADSPA filters')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2{,.asc})
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('f7f7052c120f494dd501f96becff9b5a4ae10cfbde97bc2f1e9f0fd6613a4984'
            'SKIP')

build() {
  cd ${_pkgbasename}-${pkgver}

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --shlibdir=/usr/lib32 \
    --cc="gcc -m32" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libxvid \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab

#    --enable-libdcadec \
#    --enable-libx265 \
#    --enable-libssh \
#    --enable-libsoxr \
#    --enable-libvidstab \

  make
}

package() {
  cd ${_pkgbasename}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}

# vim:set ts=2 sw=2 et:
