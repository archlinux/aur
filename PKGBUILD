# $Id: PKGBUILD 281741 2016-11-21 14:05:18Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-savage
pkgver=2.3.9
pkgrel=3
pkgdesc="X.org savage video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
optdepends=('savage-dri: DRI1 support from community repo')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig}
        git-fixes.patch)
sha256sums=('2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86'
            'SKIP'
            '72942e9b26cd6c9da745185778b89487a180871759f5d16f824ec1c307b31eb7')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C') # Julien Cristau <julien.cristau@ens-lyon.org>

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
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
