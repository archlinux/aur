# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=lib32-$_pkgbasename
pkgver=2.7.2
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL3')
depends=("$_pkgbasename"
      'lib32-alsa-lib' 'lib32-fontconfig' 'lib32-fribidi'
      'lib32-gnutls' 'lib32-gsm' 'lib32-lame' 'lib32-libass'
      'lib32-libbluray' 'lib32-libmodplug' 'lib32-libpulse'
      'lib32-libtheora' 'lib32-libva' 'lib32-libvdpau'
      'lib32-libwebp' 'lib32-opus' 'lib32-schroedinger'
      'lib32-sdl' 'lib32-v4l-utils'
      'lib32-libxv'
      'lib32-xvidcore' 'lib32-zlib'
      'libvorbis.so' 'libvorbisenc.so' 'libx264.so'
      )
makedepends=('hardening-wrapper' 'yasm')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2)
sha256sums=('7ceb7550ad628c526fa6c9ff23fdfb687a62f54d90c4a730998d8c2b417b9ef2')

build() {
  cd $_pkgbasename-$pkgver

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix=/usr \
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
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libxvid \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab

#    --enable-libopencore_amrnb \
#    --enable-libopencore_amrwb \
#    --enable-libopenjpeg \
#    --enable-libspeex \
#    --enable-libvpx \
#    --enable-libx265 \
#    --enable-libssh \

  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}

# vim:set ts=2 sw=2 et:
