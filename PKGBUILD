# $Id: PKGBUILD 281739 2016-11-21 13:55:06Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-video-siliconmotion
pkgver=1.7.8
pkgrel=3
pkgdesc="X.org siliconmotion video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig}
        git-fixes.patch)
sha256sums=('e9d449a9fd9e58b4e018447b6c64005f7874cffb1777e513ac9fc41a86071beb'
            'SKIP'
            'cc87d2e0ce857cf5c486127af6a0fc3278323c18be022e94b16f10e90fcc7b68')
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
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
