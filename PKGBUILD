# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xf86-input-evdev1.12
_pkgname=xf86-input-evdev
pkgver=2.10.0
pkgrel=1
pkgdesc="X.org evdev input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel>=1.12.0' 'xorg-server-devel<1.12.99' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.12.0' 'xorg-server>=1.12.99' 'xf86-input-evdev' 'X-ABI-XINPUT_VERSION<16' 'X-ABI-XINPUT_VERSION>=17')
provides=("$_pkgname=$pkgver")
options=('!makeflags')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117')

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
