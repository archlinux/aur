pkgname=sundtek-ffmpeg-plugin
pkgver=0.8.r15563.ge9b8523
pkgrel=1
epoch=1
pkgdesc='Sundtek driver plugin to use analog TV with tvheadend'
arch=('i686' 'x86_64')
url='http://sundtek.de/support/buildffmpeg.sh'
license=('LGPL')
depends=('sundtek')
makedepends=('git' 'lame' 'yasm')
source=('git://source.ffmpeg.org/ffmpeg.git#commit=e9b8523d52ca84d5012168db24fec2d50e73cf22')
sha256sums=('SKIP')

_gitname=ffmpeg

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  ./configure --disable-doc --disable-filters --disable-devices --disable-encoders --disable-decoders --disable-muxers --disable-demuxers --enable-shared --enable-pthreads --enable-libmp3lame --enable-encoder=mpeg2video,libmp3lame,mp2 --enable-nonfree --disable-bsfs --disable-protocols --disable-parsers --enable-muxer=mpegts,mpeg2video,mpeg2dvd --prefix=/opt/bin/plugins
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
