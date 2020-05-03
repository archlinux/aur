# $Id: PKGBUILD 281781 2016-11-21 18:46:36Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-i740
pkgver=1.4.0
pkgrel=1
pkgdesc="X.org Intel i740 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig}
        git-fixes.patch)
sha256sums=('46e401219f8ceea1faa58efd46d05a5c3f85f08d789014e7234fb755520d7a50'
            'SKIP'
            '5abbbd7d008dac0958b8bc628165864cfc03ffe76375fe1de02cd6857222b71e')
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
