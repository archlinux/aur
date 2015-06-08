# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-gtkglext
_pkgname=vice
pkgver=2.4
pkgrel=4
pkgdesc="A Versatile Commodore Emulator , with enabled gtkglext"
arch=('i686' 'x86_64')
license=('GPL')
url="http://vice-emu.sourceforge.net"
depends=('alsa-lib' 'gtkglext' 'giflib' 'libjpeg' 'libpng' 'libxrandr' 'vte' 'lame' 'libpcap' 'libnet')
makedepends=('pkg-config')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gnomeui' 'vice-sdl' 'vice-ethernet')
replaces=('vice')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz
        vice-no-fc-cache.patch vice-notexi-notxt.patch vice-x11video.patch vice-2.4-giflib-5.1.0.patch)
md5sums=('b017647a0c159bbe43cdb81762d1c577'
         'c7ba8ff930bee0e41565f4a1d9594922'
         '877f93db1550ea81386aae7c3b578442'
         '99931efcb779734c9df069e94f0b38a5'
         '94563e3023d804341f1d252c0e6d1384')


prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}"/vice-no-fc-cache.patch
  patch -Np1 -i "${srcdir}"/vice-notexi-notxt.patch
  patch -Np1 -i "${srcdir}"/vice-x11video.patch
  patch -Np1 -i "${srcdir}"/vice-2.4-giflib-5.1.0.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --enable-gnomeui \
     --enable-ethernet --disable-ffmpeg
  make
}


package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" VICEDIR=/usr/lib/vice install
}


# vim:set ts=2 sw=2 et:

