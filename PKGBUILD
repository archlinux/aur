# $Id: PKGBUILD 281777 2016-11-21 18:32:20Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-neomagic
pkgver=1.3.0
pkgrel=1
pkgdesc="X.org neomagic video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mesa' 'glibc')
makedepends=('xorg-server-devel' 'systemd' 'X-ABI-VIDEODRV_VERSION=24.0')
conflicts=('xorg-server<1.20.0' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sh512sums=('72f89396b10527549337cb72a7eafb1194cf140144f9236a94ad2becdf140bf2'
            'SKIP')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C') # Julien Cristau <julien.cristau@ens-lyon.org>

build() {
  cd ${pkgname}-${pkgver}

  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
md5sums=('349d5254d09eb46f2a1f151cd423b89a'
         'SKIP')
