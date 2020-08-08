# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-gtkglext
_pkgname=vice
pkgver=3.4
pkgrel=1
pkgdesc="A Versatile Commodore Emulator , with enabled gtkglext"
arch=('i686' 'x86_64')
license=('GPL')
url="http://vice-emu.sourceforge.net"
depends=('alsa-lib' 'gtkglext' 'giflib' 'libjpeg-turbo' 'libpng' 'libxrandr' 'vte' 'lame' 'libpcap' 'libnet' 'xa')
makedepends=('pkg-config')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gtk' 'vice-sdl' 'vice-ethernet')
replaces=('vice')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz no-fc-cache.patch)
sha256sums=('4bd00c1c63d38cd1fe01b90032834b52f774bc29e4b67eeb1e525b14fee07aeb'
            '36e88f32137c96b14283b94a15c5d85425086312165d1392bde2cab7c14f45cc')


prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np0 -i ../no-fc-cache.patch
}


build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --enable-native-gtk3ui \
    --enable-ethernet --disable-parsid
  make
}


package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" VICEDIR=/usr/lib/vice install
}


# vim:set ts=2 sw=2 et:

