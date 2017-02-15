# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-gtkglext
_pkgname=vice
pkgver=3.0
pkgrel=2
pkgdesc="A Versatile Commodore Emulator , with enabled gtkglext"
arch=('i686' 'x86_64')
license=('GPL')
url="http://vice-emu.sourceforge.net"
depends=('alsa-lib' 'gtkglext' 'giflib' 'libjpeg-turbo' 'libpng' 'libxrandr' 'vte' 'lame' 'libpcap' 'libnet')
makedepends=('pkg-config')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gtk' 'vice-sdl' 'vice-ethernet')
replaces=('vice')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz no-fc-cache.patch)
sha1sums=('424860f897b2dffd7162d133ee4a15e970491cd0'
          '1eb7b3d0574d60f4e11edfc48566019451e94ccd')


prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np0 -i ../no-fc-cache.patch
}


build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --enable-gnomeui \
    --enable-ethernet --disable-parsid
  make
}


package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" VICEDIR=/usr/lib/vice install
}


# vim:set ts=2 sw=2 et:

