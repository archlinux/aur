#Maintainer: Connor Behan <connor.behan@gmail.com>
#Contributor: Jan de Groot <jgc@archlinux.org>
#Contributor: Andrew Krawchyk <krawch_a@denison.edu>
#Contributor: Frederic Bezies <fredbezies@gmail.com>

pkgname=swfdec-devel
_pkgname=swfdec
pkgver=0.9.2
pkgrel=3
pkgdesc="Development package of the free library for decoding and rendering Flash animations"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer0.10-base>=0.10.19' 'alsa-lib>=1.0.16' 'liboil>=0.3.14' 'libmad>=0.15.1b-2' 'gtk2>=2.12.9' 'libsoup>=2.4.0')
makedepends=('pkgconfig')
optdepends=('ming: ActionScript debugging')
source=(http://swfdec.freedesktop.org/download/swfdec/0.9/${_pkgname}-${pkgver}.tar.gz)
provides=('swfdec=0.9.2')
conflicts=('swfdec')
options=('!libtool' '!emptydirs' '!makeflags')

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  FFMPEG_CFLAGS="-I/usr/include/libavcodec -I/usr/include/libswscale" ./configure --prefix=/usr --disable-static --enable-gtk \
	--enable-mad --enable-ffmpeg --disable-gnome-vfs \
	--enable-gstreamer --enable-soup --with-audio=alsa
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
md5sums=('7be5e39236e2d6efa61a18e83e5ab73d')
