# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgname=ffmpeg
pkgname=ffmpeg-headless
pkgver=3.2.3
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://ffmpeg.org/'
license=('GPL3') #enabling libfdk_aac makes ffmpeg incompatible with the GPL!
depends=('bzip2' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
		 'lame' 'libmodplug'
		 'libtheora' 'libva-headless'
		 'libwebp' 'opencore-amr' 'openjpeg2' 'opus'
		 'schroedinger' 'speex' 'v4l-utils' 'xz' 'zlib'
		 'libbluray.so'
		 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so'
		 'libx264.so' 'libx265.so' 'libxvidcore.so'
		 'rtmpdump')
makedepends=('hardening-wrapper' 'yasm')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' "ffmpeg")
conflicts=('ffmpeg')
replaces=('ffmpeg')
source=(https://ffmpeg.org/releases/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('54ce502aca10b7e6059f19220ea2f68fa0c9c4c4d255ae13e615f08f0c94dcc5')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
	--prefix='/usr' \
	--disable-debug \
	--disable-static \
	--disable-stripping \
	--enable-avisynth \
	--enable-avresample \
	--enable-gnutls \
	--enable-gpl \
	--enable-libbluray \
	--enable-libfribidi \
	--enable-libgsm \
	--enable-libmodplug \
	--enable-libmp3lame \
	--enable-libopencore_amrnb \
	--enable-libopencore_amrwb \
	--enable-libopenjpeg \
	--enable-libopus \
	--enable-libschroedinger \
	--enable-libspeex \
	--enable-libtheora \
	--enable-libv4l2 \
	--enable-libvorbis \
	--enable-libvpx \
	--enable-libwebp \
	--enable-libx264 \
	--enable-libx265 \
	--enable-libxvid \
	--enable-shared \
	--enable-vaapi \
	--enable-version3 \
	--enable-librtmp \
	--enable-runtime-cpudetect \
	--disable-ffplay \
	--disable-sdl2 \
	--disable-fontconfig \
	--disable-libfreetype \
	--disable-vdpau \
	--disable-htmlpages \
	--disable-libxcb \
	--disable-xlib  \
	--disable-libass #\
    #--enable-libiec61883
    #--enable-libsoxr \
    #--enable-libvidstab \
    #--enable-netcdf \
    #--enable-libfdk_aac \
    #--enable-nonfree

  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
