# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=lib32-$_pkgbasename
pkgver=2.4.2
pkgrel=1
epoch=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=(
      'lib32-alsa-lib' 'lib32-fontconfig'
      'lib32-gnutls' 'lib32-sdl'
      'lib32-libass' 'lib32-libbluray' 'lib32-fribidi'
      'lib32-gsm' 'lib32-libmodplug' 'lib32-lame'
      'lib32-opus' 'lib32-libpulse' 'lib32-rtmpdump' 'lib32-schroedinger'
      'lib32-libtheora' 'lib32-v4l-utils' 'lib32-libxv'
      'lib32-libx264' 'lib32-xvidcore' 'lib32-libvdpau'
      )
makedepends=('yasm')
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2)
sha256sums=('974f90a9d7bde835213ab970c2190402e5d6566e47a7bb657d756ee92540fa7e')

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
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libx264 \
    --enable-libxvid \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-swresample \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab

#    --enable-libopencore_amrnb \
#    --enable-libopencore_amrwb \
#    --enable-libopenjpeg \
#    --enable-libspeex \
#    --enable-libvpx \
#    --enable-libx265 \

  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}

# vim:set ts=2 sw=2 et:
