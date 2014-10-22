# $Id: PKGBUILD 185036 2013-05-10 14:39:15Z bpiotrowski $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=lib32-$_pkgbasename
pkgver=1.2.1
pkgrel=1
epoch=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=(
      'lib32-alsa-lib' 'lib32-bzip2' 'lib32-fontconfig'
      'lib32-zlib'
      )
makedepends=('yasm')
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2)
sha256sums=('0302375c3a64e9c2facfa7cbeb1aa333a39fdf6bbacda228cd48e04bf9ee32ca')

build() {
  cd $_pkgbasename-$pkgver

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --shlibdir=/usr/lib32 \
    --disable-debug \
    --disable-static \
    --disable-avresample \
    --disable-dxva2 \
    --enable-fontconfig \
    --enable-gpl \
    --disable-libass \
    --disable-libfreetype \
    --disable-libgsm \
    --disable-libmodplug \
    --disable-libmp3lame \
    --disable-libopencore_amrnb \
    --disable-libopencore_amrwb \
    --disable-libopenjpeg \
    --disable-libopus \
    --disable-libpulse \
    --disable-librtmp \
    --disable-libschroedinger \
    --disable-libspeex \
    --disable-libtheora \
    --disable-libv4l2 \
    --disable-libvorbis \
    --disable-libvpx \
    --disable-libx264 \
    --disable-libxvid \
    --disable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --disable-vdpau \
    --enable-version3 \
    --disable-x11grab \
    --disable-programs \
    --disable-doc \
    --disable-everything \
    --enable-encoder=ac3 \
    --enable-encoder=ac3_fixed \
    --enable-muxer=ac3 \
    --enable-parser=ac3 \
    --cc="gcc -m32"

  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
