# $Id: PKGBUILD 250667 2015-11-11 08:40:44Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-acecad
pkgver=1.5.0
pkgrel=9
pkgdesc="X.Org acecad tablet input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('sysfsutils')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=22.1' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16' 'X-ABI-XINPUT_VERSION<22.1' 'X-ABI-XINPUT_VERSION>=23')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        assign-local-private-after-allocating.patch)
sha1sums=('410cee68e4435dc95774fb389fcefae1b2ffe3d1'
          '9301020b0ef3c6f2081e957481a88d2e187a7973')

build() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/assign-local-private-after-allocating.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
