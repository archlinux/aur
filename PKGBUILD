# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ffmpeg
pkgver=0.10.13
pkgrel=2
pkgdesc="Gstreamer FFMpeg Plugin"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer0.10-base' 'bzip2')
makedepends=('pkgconfig' 'yasm' 'sdl' 'git' 'gtk-doc')
url="http://www.gstreamer.net"
groups=('gstreamer0.10-plugins')
source=("git://anongit.freedesktop.org/gstreamer-sdk/gst-ffmpeg#commit=94e587b9182c6d2fde9a61c9def790c8047453c0")
sha256sums=('SKIP')

build() {
  cd gst-ffmpeg
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --enable-gtk-doc --with-ffmpeg-extra-configure="--enable-runtime-cpudetect"
  make
}

check() {
  cd gst-ffmpeg
  make check
}

package() {
  cd gst-ffmpeg
  make DESTDIR="${pkgdir}" install
}
