# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xlibre-input-evdev
_pkgname=xf86-input-evdev
pkgver=25.0.0
pkgrel=10
pkgdesc="XLibre evdev input driver"
arch=(x86_64)
url='https://github.com/X11Libre/xf86-input-evdev'
license=('HPND-sell-variant AND MIT')
depends=('systemd-libs' 'mtdev' 'libevdev' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0' 'xorgproto')
provides=('xf86-input-evdev')
conflicts=('xf86-input-evdev' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
# options=('!makeflags')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b7498056f7394ffdf627a1db228bccc74e25eb9262ca45b1b01189ec57587092ddc56fe49dfcf28ea2829e3cee633cec4e150c3d43eb1bff39554f6200b549b6')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
