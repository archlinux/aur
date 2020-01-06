# $Id: PKGBUILD 281731 2016-11-21 12:14:44Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=xf86-video-trident
pkgver=1.3.8
pkgrel=1
pkgdesc="X.org Trident video driver"
arch=(i686 x86_64)
url="https://x.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'xf86dgaproto')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig}
        git-fixes.patch)
sha256sums=('9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f'
            'SKIP'
            '22571bf377e0cd37a8bd48e4d382f1d43010e1bde6382862c226052019120335')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../git-fixes.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
