# $Id$
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xf86-input-evdev1.12
_pkgname=xf86-input-evdev
pkgver=2.10.6
pkgrel=1
pkgdesc="X.org evdev input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'libsystemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel>=1.12.0' 'xorg-server-devel<1.12.99' 'resourceproto' 'scrnsaverproto' 'systemd')
conflicts=('xorg-server<1.12.0' 'xorg-server>=1.12.99' 'xf86-input-evdev' 'X-ABI-XINPUT_VERSION<16' 'X-ABI-XINPUT_VERSION>=17')
provides=("$_pkgname=$pkgver")
options=('!makeflags')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
